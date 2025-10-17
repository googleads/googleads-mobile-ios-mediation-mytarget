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
  platforms: [.iOS("12.4")],
  products: [
    .library(
      name: "MyTargetAdapterTarget",
      targets: ["MyTargetAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/myTargetSDK/mytarget-ios-spm.git",
      exact: "5.36.0"
    )
  ],
  targets: [
    .target(
      name: "MyTargetAdapterTarget",
      dependencies: [
        .target(name: "MyTargetAdapter"),
        .product(name: "MyTargetSDK", package: "mytarget-ios-spm"),
      ],
      path: "MyTargetAdapterTarget"
    ),
    .binaryTarget(
      name: "MyTargetAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/mytarget/MyTargetAdapter-5.36.0.0.zip",
      checksum: "9fe34c72272f6e3f0523f420e31b302f1f556b6f402b3558a81170e8bd38792f"
    ),
  ]
)
