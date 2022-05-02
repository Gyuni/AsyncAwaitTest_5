//
//  DelegateViewController_URLSessionDelegate.swift
//  AsyncAwaitTest_5
//
//  Created by gyuni on 2022/05/03.
//

import Foundation

class DelegateViewController_URLSessionDelegate: NSObject, URLSessionDataDelegate {
    private var continuation: CheckedContinuation<Data, Error>?
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        continuation?.resume(returning: data)
        continuation = nil
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            continuation?.resume(throwing: error)
            continuation = nil
        } else {
            continuation?.resume(returning: Data())
            continuation = nil
        }
    }
    
    func setContinuation(continuation: CheckedContinuation<Data, Error>) {
        self.continuation = continuation
    }
}
