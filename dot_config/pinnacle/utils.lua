local M = {}

M.notify = function(Pinnacle, args)
    local cmd = { "notify-send", args[1] }
    Pinnacle.process.spawn(cmd)
end

M.win_center = function(win)
    local geometry = win:geometry()
    print(geometry.x, geometry.y)
    return {
        x = geometry.x + geometry.width / 2,
        y = geometry.y + geometry.height / 2
    }
end

M.get_window_on = function(Pinnacle, direction)
    local COMP_BIGINT = 100000
    -- returns true if window2 is more qualified than window1
    local comparison = function(window, active, direction)
        local window_center = M.win_center(window)
        local active_center = M.win_center(active)
        print("pos", window_center.x, window_center.y, active_center.x, active_center.y)
        local dx = (window_center.x - active_center.x)
        local dy = (window_center.y - active_center.y)
        print("deltas", dx, dy)
        if direction == "right" then
            if dx <= 0 then
                return -1
            end
            if dy == 0 then
                return dx
            end
            return COMP_BIGINT * (1 + math.abs(dy)) + dx
        elseif direction == "left" then
            if dx >= 0 then
                return -1
            end
            if dy == 0 then
                return -dx
            end
            return COMP_BIGINT * (1 + math.abs(dy)) - dx
        elseif direction == "up" then
            if dy >= 0 then
                return -1
            end
            if dx == 0 then
                return -dy
            end
            return COMP_BIGINT * (1 + math.abs(dx)) - dy
        elseif direction == "down" then
            if dy <= 0 then
                return -1
            end
            if dx == 0 then
                return dy
            end
            return COMP_BIGINT * (1 + math.abs(dx)) + dy
        end
    end

    local active_window = Pinnacle.window.get_focused()
    if active_window then
        local active_tags = active_window:tags()
        local target_window = active_window
        local min_comp = COMP_BIGINT * COMP_BIGINT
        for _, tag in pairs(active_tags) do
            local windows = tag:windows()
            for _, win in pairs(windows) do
                if win then
                    local comp = comparison(win, active_window, direction)
                    print(win.id, comp, target_window.id)
                    if comp > 0 and comp < min_comp then
                        print("Found")
                        target_window = win
                        min_comp = comp
                    end
                end
            end
        end
        return target_window
    end
end

M.output_center = function(output)
    return {
        x = output.x + output.logical_width / 2,
        y = output.y + output.logical_height / 2
    }
end

M.get_output_on = function(Pinnacle, direction)
    local COMP_BIGINT = 10000000
    -- returns true if window2 is more qualified than window1
    local comparison = function(output, active, direction)
        local output_center = M.output_center(output)
        local active_center = M.output_center(active)
        print("pos", output_center.x, output_center.y, active_center.x, active_center.y)
        local dx = (output_center.x - active_center.x)
        local dy = (output_center.y - active_center.y)
        print("deltas", dx, dy)
        if direction == "right" then
            if dx <= 0 then
                return -1
            end
            if dy == 0 then
                return dx
            end
            return COMP_BIGINT * (1 + math.abs(dy)) + dx
        elseif direction == "left" then
            if dx >= 0 then
                return -1
            end
            if dy == 0 then
                return -dx
            end
            return COMP_BIGINT * (1 + math.abs(dy)) - dx
        elseif direction == "up" then
            if dy >= 0 then
                return -1
            end
            if dx == 0 then
                return -dy
            end
            return COMP_BIGINT * (1 + math.abs(dx)) - dy
        elseif direction == "down" then
            if dy <= 0 then
                return -1
            end
            if dx == 0 then
                return dy
            end
            return COMP_BIGINT * (1 + math.abs(dx)) + dy
        end
    end

    local active_output = Pinnacle.output.get_focused()
    if active_output then
        local outputs = Pinnacle.output.get_all_enabled()
        local target_output = active_output
        local min_comp = COMP_BIGINT * COMP_BIGINT
        for _, output in pairs(outputs) do
            if output then
                local comp = comparison(output, active_output, direction)
                print(output.id, comp, target_output.id)
                if comp > 0 and comp < min_comp then
                    print("Found")
                    target_output = output
                    min_comp = comp
                end
            end
        end
        return target_output
    end
end

return M
