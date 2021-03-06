
function get_diagsum(rows::Int)::Int
    layers = (rows + 1) / 2
    diagsum = 1
    layerend_value = 1
    layer = 1

    while layer <= layers
        numbers_in_layer = ((layer-1) * 2 - 1) * 4 + 4
        layerend_value += numbers_in_layer  # 1, 9, 25, ...
        diag_steps = (layer * 2) - 2        # 0, 2, 4, ...
        top_right = layerend_value                   # 1, 9, 25, ...
        top_left = layerend_value - diag_steps       # 1, 7, 21, ...
        bot_left = layerend_value - diag_steps * 2   # 1, 5, 17, ...
        bot_right = layerend_value - diag_steps * 3  # 1, 3, 13
        diagsum += (top_right + top_left + bot_left + bot_right)
        layer += 1
    end

    # remove the 1 at the middle of the spiral which we have added 4 times
    return diagsum - 4
end

# in a 5 by 5 spiral there are 3 layers with a diagsum of 101
#println(get_diagsum(5))  # 101

println(get_diagsum(1001))  # 669,171,001
