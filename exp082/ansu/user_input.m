zonally_periodic=true;
choice= 'epsilon'; % density gradient error
solver = 'iterative';
nit = 21;

save_iterations=true; % save variables for postprocessing 
history_file='data/iteration_history.mat'; % absolute path or path relative to the topmost calling function 

% TODO: the following should be set somewhere else
initial_surface_at_constant_pressure=true;
if initial_surface_at_constant_pressure;
    initial_pressure=1e3;
    nlevels=length(initial_pressure);
else
    glevels=[27.5];
    nlevels=length(initial_pressure);
end
