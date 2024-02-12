chmod a+x bash/update_android.sh
./bash/update_android.sh
fvm flutter build appbundle --target lib/main.dart --obfuscate --split-debug-info=build --no-tree-shake-icons