% TODO: the following should be set somewhere else
initial_surface_at_constant_pressure=false;
%initial_surface_at_constant_pressure=true;
if initial_surface_at_constant_pressure;
    initial_pressure=1e3;
    nlevels=length(initial_pressure);
else 
    nlevels=1;
    disp('constant salinity, starting surf. is neither isobar nor pot. dens. surface')
end

