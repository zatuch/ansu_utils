function [g] = gamma_ew(s,pt)

%           Calculate Eden/Willebrand neutral density
%
% Usage:    [g] = gamma_ew(s,pt)
%
%           Calculate gamma through an approximate function in terms of
%           salinity and potential temperature according to 'Neutral density 
%           revisited, Eden and Willebrand, 1999'; This function is
%           constructed for the North Atlantic only.
%
%
% Input:    s           salinity
%           pt          potential temperature
%
% Output:   g           gamma       
%
% Calls:          
%
% Units:    salinity                    psu (IPSS-78)
%           potential temperature       degrees C (IPS-90)
%           g                           kg/m^3
%
%   _________________________________________________________________
%   This is part of the analyze_surface toolbox, (C) 2009 A. Klocker
%   Partially modified by P. Barker (2010-13)
%   Partially modified by S. Riha (2013)
%   type 'help analyze_surface' for more information 
%   type 'analyze_surface_license' for license details
%   type 'analyze_surface_version' for version details
%

%% check input arguments

if ~(nargin ==2)
  error('gamma_ew.m: requires 2 input arguments')
end 

%% calculate gamma

pt2 = pt.*pt; pt3 = pt2.*pt; pt4 = pt2.*pt2; pt5 = pt4.*pt; pt6 = pt4.*pt2;
s2 = s.*s; s3 = s2.*s; s4 = s2.*s2; s5 = s4.*s; s6 = s4.*s2;

g =                      14716.4083300335 + ...
            s.*            -28.9331001608859 + ...
            pt .*        -3470.91951031568 + ...
            s2 .*         -157.954300909566 + ...
            pt .* s .*     473.289175127584 + ...
            pt2 .*          -4.64974069615661 + ...
            s3 .*           11.3969084253582 + ...
            s2 .* pt .*    -25.4768804193708 + ...
            s .* pt2 .*     -0.389834308335937 + ...
            pt3 .*           0.835094681378189 + ...
            s4 .*           -0.343532351230610 + ...
            s3 .* pt .*      0.675628658364396 + ...
            s2 .* pt2 .*     5.414334185691196e-2 + ...
            s .* pt3 .*     -6.816453081396268e-2 + ...
            pt4 .*          -1.728955910178931e-3 + ...
            s5 .*            4.873910348419327e-3 + ...
            s4 .* pt .*     -8.806940306192767e-3 + ...
            s3 .* pt2 .*    -1.695268507497124e-3 + ...
            s2 .* pt3 .*     1.804453633002675e-3 + ...
            s .* pt4 .*      1.805489877717028e-4 + ...
            pt5 .*          -4.894077892307525e-5 + ...
            s6 .*           -2.681726391903187e-5 + ...
            s5 .* pt .*      4.499131748650225e-5 + ...
            s4 .* pt2 .*     1.645151764773905e-5 + ...
            s3 .* pt3 .*    -1.547343330658305e-5 + ...
            s2 .* pt4 .*    -3.625108540563305e-6 + ...
            s .* pt5 .*      1.341416007328966e-6 + ...
            pt6 .*          -8.036621802403113e-9;