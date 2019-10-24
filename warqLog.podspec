Pod::Spec.new do |s|

    s.name          = "warqLog"
    s.version       = "0.0.2"
    s.summary       = "Wallapop Log Artifact for Aquitecture framework"
    s.description  = <<-DESC
    "A test project to create a Log Artifact for Aquitecture framework"
    DESC
    s.homepage      = "https://github.com/JosepEscobar/warqLog"
    s.license       = { :type => "Internal" }
    s.author        = "Josep Escobar"
    s.source        = { :git => "https://github.com/JosepEscobar/warqLog.git", :tag => s.version }
    s.source_files  = "warqLog", "warqLog/**/*.{h,m,swift,plist}"
    s.platform      = :ios, "11.0"
    s.swift_version = "5"
    s.exclude_files = ["warqLog/Exclude", "warqLog/AppDelegate.swift", "warqLog/LaunchScreen.storyboard", "warqLog/Info.plist", "Pods"]

end
