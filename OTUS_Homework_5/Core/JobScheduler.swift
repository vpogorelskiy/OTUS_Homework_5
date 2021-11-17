import Foundation

final class JobScheduler {
    private static let sharedInstance: JobScheduler = .init()
    
    private var _jobs: [UUID: Job] = [:]
    private var jobs: [UUID: Job] {
        get {
            defer {
                lock.unlock()
            }
            lock.lock()
            return _jobs
        }
        set {
            scheduleQueue.async {
                self._jobs = newValue
            }
        }
    }
    
    private let scheduleQueue: DispatchQueue = .init(label: "JobSchedulerQueue")
    private let lock  = NSRecursiveLock()
    
    static func execute(_ closure: @escaping (JobDuration) -> Void, on queue: DispatchQueue = .global()) {
        let job = Job(closure: closure)
        sharedInstance.jobs[job.id] = job
        queue.async {
            job.closure(job.duration)
            sharedInstance.jobs[job.id] = nil
        }
    }
}

struct Job {
    let id = UUID()
    let duration = JobDuration()
    let closure: (JobDuration) -> Void
}

struct JobDuration {
    let startTime = CFAbsoluteTimeGetCurrent()
    func getDuration() -> Double {
        CFAbsoluteTimeGetCurrent() - startTime
    }
}
