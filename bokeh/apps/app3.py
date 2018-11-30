import numpy as np
from bokeh.io import output_notebook, show
from bokeh.plotting import figure, curdoc
output_notebook()

p = figure(plot_width=400, plot_height=400, title="My Line Plot")

# add a line renderer
p.line([1, 2, 3, 4, 5, 6], [6, 7, 2, 4, 5, 20], line_width=1)

#show(p) # show the results
curdoc().add_root(p)
