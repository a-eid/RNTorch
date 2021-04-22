import Foundation
import AVFoundation

@objc(Torch)
class Torch: NSObject {
  
  @objc
  func on(){
    toggleFlash(on: true)
  }
  
  @objc
  func off(){
    toggleFlash(on: false)
  }
  
  
  private func toggleFlash(on: Bool ) {
      guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else { return }
      
      do {
          try device.lockForConfiguration()
          
          device.torchMode = on ? .on : .off
          if on {
              try device.setTorchModeOn(level: AVCaptureDevice.maxAvailableTorchLevel)
          }
          
          device.unlockForConfiguration()
      } catch {
          print("Error: \(error)")
      }
  }

}
