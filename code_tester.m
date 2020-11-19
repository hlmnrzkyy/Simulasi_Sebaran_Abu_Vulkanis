% create ncgeodataset object
nc=ncgeodataset('gfs_3_20190726_0000_006.grb2');

% list variables
nc.variables

% create geovariable object
dirvar=nc.geovariable('Primary_wave_direction_degree_true_surface');

% get data at 1st time step
dir=dirvar.data(1,:,:);

% get grid at 1st time step
g=dirvar.grid_interop(1,:,:);

% plot
pcolorjw(g.lon,g.lat,dir);
title(datestr(g.time))