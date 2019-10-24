Pod::Spec.new do |s|

s.name          = "warqLog"
s.version       = "0.0.1"
s.summary       = "Wallapop Log Artifact for Aquitecture framework"
s.description   = "Wallapop Log Artifact for Aquitecture framework"
s.homepage      = "https://github.com/JosepEscobar/warqLog"
s.license       = { :type => "Internal" }
s.author        = "Josep Escobar"
s.source        = { :git => "https://github.com/JosepEscobar/warqLog.git", :tag => s.version }
s.source_files  = "warqLog/**/*.{h,m,swift,plist}"
s.platform      = :ios, "11.0"
s.exclude_files = ["warqLog/Exclude", "warqLog/AppDelegate.swift", "warqLog/LaunchScreen.storyboard", "warqLog/Info.plist"]

end
