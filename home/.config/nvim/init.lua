vim.env.JAVA_HOME = os.getenv("HOME") .. '/.sdkman/candidates/java/21.0.10-tem'
local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('user.settings')
load('user.keymaps')
load('user.plugins')

