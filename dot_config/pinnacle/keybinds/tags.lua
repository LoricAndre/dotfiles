local opts = require("opts")

return {
    setup = function(Pinnacle)
        local Input = Pinnacle.input
        local Tag = Pinnacle.tag
        local Window = Pinnacle.window
        local Output = Pinnacle.output
        local Layout = Pinnacle.layout
        local Util = Pinnacle.util

        local mod_key = opts.mod

        for i, tag in pairs(opts.tags) do
            -- nil-safety: tags are guaranteed to be on the outputs due to connect_for_all above
            local tag_name = tag.name or tostring(i)

            print("Creating mappings for " .. tag_name .. "(" .. tag.key .. ")")
            -- mod_key + 1-5 = Switch to tags 1-5
            Input.keybind({ mod_key }, tag.key, function()
                Tag.get(tag_name):switch_to()
            end, {
                group = "Tag",
                description = "Switch to tag " .. tostring(tag_name),
            })

            -- mod_key + ctrl + 1-5 = Toggle tags 1-5
            Input.keybind({ mod_key, "ctrl" }, tag.key, function()
                Tag.get(tag_name):toggle_active()
            end, {
                group = "Tag",
                description = "Toggle tag " .. tag_name,
            })

            -- mod_key + shift + 1-5 = Move window to tags 1-5
            Input.keybind({ mod_key, "shift" }, tag.key, function()
                local focused = Window.get_focused()
                if focused then
                    focused:move_to_tag(Tag.get(tag_name) --[[@as TagHandle]])
                end
            end, {
                group = "Tag",
                description = "Move the focused window to tag " .. tag_name,
            })

            -- mod_key + ctrl + shift + 1-5 = Toggle tags 1-5 on window
            Input.keybind({ mod_key, "ctrl", "shift" }, tag.key, function()
                local focused = Window.get_focused()
                if focused then
                    focused:toggle_tag(Tag.get(tag_name) --[[@as TagHandle]])
                end
            end, {
                group = "Tag",
                description = "Toggle tag " .. tag_name .. " on the focused window",
            })
        end

        local key = Input.key
        -- mod_key + space = Cycle forward one layout on the focused output
        --
        -- Yes, this is a bit verbose for my liking.
        -- You need to cycle the layout on the first active tag
        -- because that is the one that decides which layout is used.
        -- Input.keybind({ mod_key }, key.space, function()
        --     local focused_op = Output.get_focused()
        --     if focused_op then
        --         local focused_tags = focused_op:tags() or {}
        --         local tag = nil
        --
        --         ---@type (fun(): (boolean|nil))[]
        --         local tag_actives = {}
        --         for i, t in ipairs(focused_tags) do
        --             tag_actives[i] = function()
        --                 return t:active()
        --             end
        --         end
        --
        --         -- We are batching API calls here for better performance
        --         tag_actives = Util.batch(tag_actives)
        --
        --         for i, active in ipairs(tag_actives) do
        --             if active then
        --                 tag = focused_tags[i]
        --                 break
        --             end
        --         end
        --
        --         if tag then
        --             layout_manager:cycle_layout_forward(tag)
        --             Layout.request_layout(focused_op)
        --         end
        --     end
        -- end, {
        --     group = "Layout",
        --     description = "Cycle the layout forward on the first active tag",
        -- })

        -- mod_key + shift + space = Cycle backward one layout on the focused output
        -- Input.keybind({ mod_key, "shift" }, key.space, function()
        --     local focused_op = Output.get_focused()
        --     if focused_op then
        --         local tags = focused_op:tags() or {}
        --         local tag = nil
        --
        --         ---@type (fun(): (boolean|nil))[]
        --         local tag_actives = {}
        --         for i, t in ipairs(tags) do
        --             tag_actives[i] = function()
        --                 return t:active()
        --             end
        --         end
        --
        --         tag_actives = Util.batch(tag_actives)
        --
        --         for i, active in ipairs(tag_actives) do
        --             if active then
        --                 tag = tags[i]
        --                 break
        --             end
        --         end
        --
        --         if tag then
        --             layout_manager:cycle_layout_backward(tag)
        --             Layout.request_layout(focused_op)
        --         end
        --     end
        -- end, {
        --     group = "Layout",
        --     description = "Cycle the layout backward on the first active tag",
        -- })
    end
}
