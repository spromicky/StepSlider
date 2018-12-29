Pod::Spec.new do |s|
  s.name         = "StepSlider"
  s.version      = "1.4.0"
  s.summary      = "StepSlider its custom implementation of slider such as UISlider for preset values. Its based on drawing directly on CAShapeLayer."
  s.homepage     = "https://github.com/spromicky/StepSlider"
  s.screenshots  = "https://github.com/spromicky/StepSlider/blob/master/screenshots/example.gif?raw=true"
  s.license      = 'MIT'
  s.author       = { "spromicky" => "spromicky@gmail.com" }
  s.source       = { :git => "https://github.com/spromicky/StepSlider.git", :tag => s.version.to_s }

  s.platform     = :ios, '10.0'
  s.requires_arc = true

  s.source_files = 'StepSlider/source/StepSlider/*'
end
