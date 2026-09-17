//
//  SpectralViewController.swift
//  TempiHarness
//
//  Created by John Scalo on 1/7/16.
//  Copyright © 2016 John Scalo. All rights reserved.
//

import UIKit
import AVFoundation

class SpectralViewController: UIViewController {
    //    let spectralView: SpectralView =
    //    override public class var view
    var spectralView: SpectralView { view as! SpectralView }
    
    var audioInput: TempiAudioInput!
    
    //    init(spectralView: SpectralView!, audioInput: TempiAudioInput!) {
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
        self.view = SpectralView()
        
        //        self.view.addSubview(spectralView)
        
        //
        //
        //        spectralView.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //
        //            spectralView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
        //            spectralView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        //            spectralView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
        //            spectralView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        //
        //
        //        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let audioInputCallback: TempiAudioInputCallback = { (timeStamp, numberOfFrames, samples) -> Void in
            self.gotSomeAudio(timeStamp: Double(timeStamp), numberOfFrames: Int(512), samples: samples)
            //            self.gotSomeAudio(timeStamp: Double(timeStamp), numberOfFrames: Int(numberOfFrames), samples: samples)
        }
        
        audioInput = TempiAudioInput(audioInputCallback: audioInputCallback, sampleRate: 44100, numberOfChannels: 1)
        audioInput.startRecording()
    }
    
    func gotSomeAudio(timeStamp: Double, numberOfFrames: Int, samples: [Float]) {
        // NB: The default buffer size on iOS is 512. This will not give a terribly high resolution. In practice you'll want to bucket up the buffers into a larger array of at least size 2048.
        let fft = TempiFFT(withSize: numberOfFrames, sampleRate: 600)
        fft.windowType = TempiFFTWindowType.hanning
        fft.fftForward(samples)
        
        // Interpoloate the FFT data so there's one band per pixel.
//        let screenWidth = UIScreen.main.bounds.size.width * UIScreen.main.scale
//        let screenWidth = view.window?.windowScene?.screen.bounds.width * view.contentScaleFactor
        DispatchQueue.main.async {
            let screenWidth = self.view.window?.bounds.width ?? 200 * self.view.contentScaleFactor
            fft.calculateLinearBands(minFrequency: 0, maxFrequency: fft.nyquistFrequency, numberOfBands: Int(screenWidth))
            self.spectralView.fft = fft
            self.spectralView.setNeedsDisplay()
        }
//        
//        
//        // NB: The UI in this demo app is geared towards a linear calculation. If you instead use calculateLogarithmicBands, the labels will not be placed correctly.
//        
//        
//        tempi_dispatch_main { () -> () in
//            
//        }
    }
    
    //        guard let identifier = view as? SpectralView else {
    //            fatalError("not created spectralview")
    //        }
    
    
    //
    //        tempi_dispatch_main { () -> () in
    //            view.fft = fft
    //            view.setNeedsDisplay()
    //        }
    
    
    override func didReceiveMemoryWarning() {
        NSLog("*** Memory!")
        super.didReceiveMemoryWarning()
    }
}

