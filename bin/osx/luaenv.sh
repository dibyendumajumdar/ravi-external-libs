export LUA_HOME=$HOME/lua53
export PATH=$LUA_HOME/bin:$PATH
export DYLD_LIBRARY_PATH=$LUA_HOME/lib:$DYLD_LIBRARY_PATH
export LUA_PATH="$LUA_HOME/share/lua/5.3/?.lua;$LUA_HOME/share/lua/5.3/?/init.lua;./?.lua;./?/init.lua"
export LUA_CPATH="$LUA_HOME/lib/?.dylib;$LUA_HOME/lib/lib?.dylib"
export LUA_CPATH="$LUA_CPATH:$LUA_HOME/lib/?.so;$LUA_HOME/lib/lib?.so"
