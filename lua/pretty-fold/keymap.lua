local keymap = {}

---Get map
---@param mode string
---@param lhs string
---@return table
function keymap.get_map(mode, lhs)
   for _, map in ipairs(vim.api.nvim_buf_get_keymap(0, mode)) do
      if map.lhs == lhs then
         return {
            lhs = map.lhs,
            rhs = map.rhs or '',
            expr = map.expr == 1,
            callback = map.callback,
            noremap = map.noremap == 1,
            script = map.script == 1,
            silent = map.silent == 1,
            nowait = map.nowait == 1,
            buffer = true,
         }
      end
   end

   for _, map in ipairs(vim.api.nvim_get_keymap(mode)) do
      if map.lhs == lhs then
         return {
            lhs = map.lhs,
            rhs = map.rhs or '',
            expr = map.expr == 1,
            callback = map.callback,
            noremap = map.noremap == 1,
            script = map.script == 1,
            silent = map.silent == 1,
            nowait = map.nowait == 1,
            buffer = false,
         }
      end
   end

   return {
      lhs = lhs,
      rhs = lhs,
      expr = false,
      callback = nil,
      noremap = true,
      script = false,
      silent = false,
      nowait = false,
      buffer = false,
   }
end


return keymap
