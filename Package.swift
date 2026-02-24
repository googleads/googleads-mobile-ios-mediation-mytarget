// swift-tools-version:5.6

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "MyTargetAdapter",
  platforms: [.iOS(.v14)],
  products: [
    .library(
      name: "MyTargetAdapterTarget",
      targets: ["MyTargetAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/myTargetSDK/mytarget-ios-spm.git",
      exact: "5.40.0"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.0.0"
    ),
  ],
  targets: [
    .target(
      name: "MyTargetAdapterTarget",
      dependencies: [
        .target(name: "MyTargetAdapter"),
        .product(name: "MyTargetSDK", package: "mytarget-ios-spm"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "MyTargetAdapterTarget"
    ),
    .binaryTarget(
      name: "MyTargetAdapter",
      url: "https://dl.google.com/googleadmobadssdk/mediation/ios/mytarget/MyTargetAdapter-5.40.0.0.zip",
      checksum: "51e3b7e810cbf7eba3fdcb36053e30052684e40d34ae7113c075c835a4b82da2"
    ),
  ]
)
