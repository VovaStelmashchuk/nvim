local M = {}

function M.is_nixos()
  -- Check for NIX_PATH environment variable
  local nix_path = os.getenv("NIX_PATH")
  if nix_path ~= nil then
    return true
  end

  -- Check for /nix/store directory
  local nix_store = io.open("/nix/store", "r")
  if nix_store ~= nil then
    nix_store:close()
    return true
  end

  return false
end

function M.is_macos()
  -- Check the operating system name
  local os_name = io.popen("uname"):read("*l")
  return os_name == "Darwin"
end

return M
