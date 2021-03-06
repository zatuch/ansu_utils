function [grad_x,grad_y] = grad_surf(var_surf,e1t,e2t,keyword)

%           Find the gradient of a variable in x and y-direction.
%
% Usage:    [grad_x,grad_y] = grad_surf(var_surf,e1t,e2t,keyword)
%
%
% Input:    var                   variable 
%           e1t                   zonal scale-factor at var_surf points 
%           e2t                   meridional scale-factor at var_surf 
%                                 points
%           keyword               'op' for slopes on var_surf points
%                                 'bp' for slopes between var_surf
%                                 points
%
% Output:   grad_x                gradient in zonal direction 
%           grad_y                gradient in meridional direction 
%
% Units:    scale factors         m         
%
%   _________________________________________________________________
%   This is part of the analyze_surface toolbox, (C) 2009 A. Klocker
%   Partially modified by P. Barker (2010-13)
%   Partially modified by S. Riha (2013)
%   type 'help analyze_surface' for more information 
%   type 'analyze_surface_license' for license details
%   type 'analyze_surface_version' for version details
%

settings; % read switch zonally_periodic
%% check input arguments

if ~(nargin == 4)
    error('grad_surf.m: requires 4 input arguments')
end

%% calculate gradients

test = length(size(var_surf));

if  (test == 3) % time-independent data

    [gi,yi,xi] = size(var_surf);

    e1t = repmat(e1t,[1 1 gi]);
    e1t = permute(e1t,[3 1 2]);

    e2t = repmat(e2t,[1 1 gi]);
    e2t = permute(e2t,[3 1 2]);

    % calculate slope in longitude direction
    
    grad_x = ( circshift(var_surf,[0 0 -1])-var_surf )./ e1t;
    if ~zonally_periodic;
        grad_x(:,:,xi)=nan;
    end

    % calculate slope in latitude direction

     grad_y = ( circshift(var_surf,[0 -1 0])-var_surf )./ e2t;
     grad_y(:,yi,:) = nan;
 
     if strcmp(keyword,'op');
             error('not implemented')
     end

    
else % time-dependent data

    error('not implemented')
    
end