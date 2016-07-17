Pod::Spec.new do |s|
  s.name         = "StepSlider"
  s.version      = "0.1.3"
  s.summary      = "StepSlider is a slider for integer values."
  s.homepage     = "https://github.com/spromicky/StepSlider"
  s.screenshots  = "https://github.com/spromicky/StepSlider/blob/master/example.gif?raw=true"
  s.license      = 'MIT'
  s.author       = { "spromicky" => "spromicky@gmail.com" }
  s.source       = { :git => "https://github.com/spromicky/StepSlider.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'StepSlider/source/StepSlider/*'
end
