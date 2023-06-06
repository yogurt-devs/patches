
echo "Applying Carrier Aggregation patches"
cd frameworks/base || exit 1
curl https://github.com/sarthakroy2002/frameworks_base/commit/d217c2c9f15175e0eff1e35f1cc26685b1959764.patch | git am -3
curl https://github.com/begonia-dev/android_frameworks_base/commit/2dd4ceaae6f0e21acc608bb9752b1ffe41d1217c.patch | git am -3 
cd ../.. 

cd packages/apps/Settings || exit 1
curl https://github.com/begonia-dev/android_packages_apps_Settings/commit/a88066cb1451edb42e75eb66d3b6b8a3dbcba9a6.patch | git am -3 
cd ../../..

echo "Apply MTK Enhancements"
cd frameworks/native || exit 1
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_native refs/changes/51/18651/1 && git cherry-pick FETCH_HEAD
git fetch https://github.com/begonia-dev/android_frameworks_native && git cherry-pick 629aa1b40ceb83b57c8bd4803036013029586e11
cd ../..

echo "Applying patches for dead device"
cd frameworks/av || exit 1
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_av refs/changes/55/18655/1 && git cherry-pick FETCH_HEAD
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_av refs/changes/56/18656/1 && git cherry-pick FETCH_HEAD
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_av refs/changes/57/18657/1 && git cherry-pick FETCH_HEAD
cd ../..

echo "Applying IMS Patches (Some ROMs may have it)"
cd frameworks/opt/net/ims && git fetch https://github.com/AOSP-13-RMX2020/frameworks_opt_net_ims && git cherry-pick 0e8a88ecdbf05509f84bd136c63d56791dbf78c3^..5c6179402cd8a5fc29dbd789e59a5ddf5546c1b3 && cd ../../../.. 
cd packages/modules/Wifi && git fetch https://github.com/AOSP-13-RMX2020/packages_modules_Wifi && git cherry-pick 1315ccb757bd2d7c63b4815ab77e04535d2b7750^..6b341eefeb1127a97dc3b77a853e30ed7630be30 && cd ../../.. 
cd frameworks/opt/telephony && git fetch https://github.com/AOSP-13-RMX2020/frameworks_opt_telephony && git cherry-pick 3d7ef06b1370b98fc9893693a23b2f350a8d912d && cd ../../..
cd frameworks/base && git fetch https://github.com/ArrowOS/android_frameworks_base arrow-13.0 && git cherry-pick f627e89f23690ebf10ee46a0a3cdc456562ccb02 && git cherry-pick f5ef95dbb73ce6d0167dd085cbca11049919b8a4 && cd ../..
