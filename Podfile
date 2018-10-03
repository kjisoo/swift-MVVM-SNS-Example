# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MVVM-SNS' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MVVM-SNS
  pod 'RxSwift', '~>4.0'
  pod 'RxCocoa', '~>4.0'

  pod 'Swinject'
  pod 'SwinjectStoryboard'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'SwinjectStoryboard'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
  end

  target 'MVVM-SNSTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick', '~> 1.0'
    pod 'Nimble', '~> 7.0'
  end

end
