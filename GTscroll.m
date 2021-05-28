function GTscroll(fig)
% GTscroll  Use the scroll wheel to navigate figure windows
%
% function GTscroll(fig)
%
%    Updated the figure WindowScrollWheelFcn so that 
%    the mouse scroll wheel can be used to cycle 
%    through the figures.
%
%    One can set the default figure create function to 
%    automatically activate this function when a new 
%    figure is created with the following command,
%      GTscroll('install');
%    and it can be removed from the DefaultFigureCreateFcn
%    with,
%      GTscroll('uninstall');
%
% Example - To apply this to all figures
%   GTscroll;
%
% Example - To apply this to only one figure
%   GTscroll(gcf);
%
% Gus - Jan 2008

  if (nargin>0 && ischar(fig)),  
    % Remove function from DefaultFigureCreateFcn
    set(0,'DefaultFigureCreateFcn',regexprep(get(0,'DefaultFigureCreateFcn'),'GTscroll\(gcf\);',''));
    switch lower(fig),
      case ('install'),  % add function to DefaultFigureCreateFcn
        disp('Setting DefaultFigureCreateFcn');
        set(0,'DefaultFigureCreateFcn',['GTscroll(gcf); ' get(0,'DefaultFigureCreateFcn')]);
      case ('uninstall'),  % Already removed
        return  
    end;  
    CH = get(0,'children');
  elseif nargin>0,
    CH = fig;     
  else
    CH = get(0,'children');
  end;  

  % cycle through figures
  for ii = 1:length(CH),
    % the zoom function casues problems and should be deactivated first  
    Hz = zoom(CH(ii));
    if strcmpi(Hz.enable,'on'),
      Hz.enable = 'off';
      zm = 1;  % remember to reactivate zoom
    else
      zm = 0;
    end;
    % set WindowScrollWheelFcn, but dsplay warning if replacing existing
    % function
    if ~isempty(get(CH(ii),'WindowScrollWheelFcn')),
      warning('GTscroll:info','GTscroll has replaced the original WindowScrollWheelFcn on Figure %g',CH(ii));
    end;
    set(CH(ii),'WindowScrollWheelFcn',@figScroll);
    % reactivate zoom
    if (zm), Hz.enable = 'on'; end;
  end;  

%% --------------------------------
%   function figScroll(src,evnt)
%     % get figure handles and sort them  
%     H = sort(get(0,'children'));
%     if (evnt.VerticalScrollCount>0), 
%       % scroll down 
%       F = find(H>src,1);
%     else  
%       % scroll up  
%       F = find(H<src,1,'last'); 
%     end;  
%     if isempty(F), 
%       % jump to first or last figure  
%       if (evnt.VerticalScrollCount<0),
%         figure(H(end));
%       else
%         figure(H(1));
%       end;
%     else
%       % goto next figure
%       figure(H(mod(F-1,length(H))+1)); 
%     end;
%   end 

function figScroll(src,evnt) 
    % get figure handles and sort them
    H = sort(get(0,'children'));
    [~, in]=sort([H.Number]);
    H=H(in);
    if (evnt.VerticalScrollCount>0),
        % scroll down
        %F = find(H>src,1);
        if isempty(find([H.Number]<src.Number,1)),
            F=max([H.Number]);
        else
            F=find([H.Number]<src.Number,1,'last'); %valerio
        end
    else
        % scroll up
        %F = find(H<src,1,'last');
        if isempty(find([H.Number]>src.Number,1)),
            F=min([H.Number]);
        else
            F=find([H.Number]>src.Number,1); %valerio
        end
    end;
    if isempty(F),
        % jump to first or last figure
        if (evnt.VerticalScrollCount<0),
            figure(H(end));
        else
            figure(H(1));
        end;
    else
        % goto next figure
        figure(H(mod(F-1,length(H))+1));
    end;
end

end 
