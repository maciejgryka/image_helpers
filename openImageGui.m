function [im file path] = openImageGui(varargin)
%OPENIMAGEGUI Shows an 'Open File' dialog allowing to select an image to
%load.
%
%   OPENIMAGEGUI starts in current directory.
%
%   OPENIMAGEGUI(PATH) starts in directory specified by PATH.
%
%   OPENIMAGEGUI(PATH, FILTER) starts in directory specified by path and
%   only shows files with extension FILTER.

    path = '';
    filter = '';
    if nargin > 0
        path = [varargin{1} '\'];
        if nargin > 1
            filter = ['.' varargin{2}];
        end
    end
    
    [file, path] = uigetfile([path '*' filter], 'Open File');
    im = imread([path file]);
    im = double(im)/255;
end