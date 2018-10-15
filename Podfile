platform :ios, '9.0'

def rx
  pod 'RxSwift', '~>4.0'
  pod 'RxCocoa', '~>4.0'
  pod 'RxDataSources'
  pod 'RxObserve'
end

def testing
  pod 'Quick', '~> 1.0'
  pod 'Nimble', '~> 7.0'
end

target 'MVVM-SNS' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  rx

  pod 'Kingfisher'

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

    testing

  end
end

target 'ViewModel' do
  use_frameworks!

  rx

  target 'ViewModelTests' do
    inherit! :search_paths

    testing

  end 
end

target 'Model' do
  use_frameworks!

  rx

  target 'ModelTests' do
    inherit! :search_paths

    testing

  end
end
