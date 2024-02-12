chmod a+x bash/update_ios.sh
./bash/update_ios.sh
fvm flutter build ipa --target lib/main.dart --obfuscate --split-debug-info=build --no-tree-shake-icons