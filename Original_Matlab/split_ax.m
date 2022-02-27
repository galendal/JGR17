%Create two overlapping axes
axes_handle_1 = axes;
axes_position = get(axes_handle_1, 'Position');
axes_handle_2 = axes('Position', axes_position);
%Create some data with a large gap in the x domain
my_x_data = [1:10 25:35];
my_y_data = rand(1, length(my_x_data));
%Plot the two sections of data on different axes objects
plot(axes_handle_1, my_x_data(1:10), my_y_data(1:10))
plot(axes_handle_2, my_x_data(11:end), my_y_data(11:end))
%Link the y axis limits and fontsize property of the axes objects
linkaxes([axes_handle_1 axes_handle_2], 'y');
linkprop([axes_handle_1 axes_handle_2], 'FontSize');
%Set the x range limits and tick mark positions of the first axes object
set(axes_handle_1, 'XLim', [1 21], ...
      'XTick', [1 5 10])
%Set the x range limits and tick mark positions for the second axes object.
%Also set the background color to 'none', which makes the background
%transparent.
set(axes_handle_2, 'Color', 'none', ...
      'YTickLabel', [], ...
      'XLim', [14 35], ...
      'XTick', [25 30 35])
diary ogg
