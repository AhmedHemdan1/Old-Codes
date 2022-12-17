function Simple_GUI
% SIMPLE_GUI Select a data set from the pop-up menu, then
% click one of the plot-type push buttons. clicking the button
% plots the selected data in the axes
% Initialize and hide the GUI as it is being consructed.
f=figure('Position',[360,500,450,265]);
% Construct the components.
hsurf = uicontrol('style','pushbutton','String','Surf','Position',[315,230,70,25],'Callback',{@surfbutton_Callback});
hmesh =uicontrol('style','pushbutton','String','Mesh','Position',[315,190,70,25],'Callback',{@meshbutton_Callback});
hcontour =uicontrol('style','pushbutton','String','contour','Position',[315,150,70,25],'Callback',{@contourbutton_Callback});
hpopup=uicontrol('style','popupmenu','String',{'Peaks','Membrane','Sinc'},'Position',[300,50,100,25],'Callback',{@popup_menu_Callback});
htext1=uicontrol('style','text','String','Surf','Position',[350,120,60,15]);
htext2=uicontrol('style','text','String','Peaks','Position',[350,90,60,15]);
axe=axes('Units' , 'pixels' , 'Position',[50,60,200,165]);
align([hsurf,hmesh,hcontour,htext1,htext2,hpopup],'Center','None');
% Initialize the GUI
% Change units to normalized so components resize automatically.
set([f,hsurf,hmesh,hcontour,htext1,htext2,hpopup,axe],'Units','normalized');
% Generate the data to plot.
peaks_data=peaks(35);
membrane_data=membrane;
[x,y]=meshgrid(-6:.5:6);
r=sqrt(x.^2+y.^2);
sinc_data=sin(r)./r;
% Create a plot in the axes.
current_data=peaks_data;
surf(current_data);
% Assign the GUI a name to appear in the window title.
set(f,'Name','Simple GUI')
% Move the GUI to the center of the screen
movegui(f,'center');
% Pop-up menu callback. Read the pop-up menu Value property
% to determine which item is currently displayed and make it
% the current data. This callback automatically has access to
% current data because this function is nested at a lower level.
function popup_menu_Callback(source,~)
%Determine the selected data set.
str=get(source,'string');
val=get(source,'Value');
% Set current data to the selected data set.
switch str{val}
case 'Peaks' %User selects Peaks
current_data = peaks_data;
set(htext2,'string','Peaks');
get(axe);
case 'Membrane' %User selects Membrane
current_data = membrane_data;
set(htext2,'string','Membrane');
get(axe);
case 'Sinc' % User selects Sinc
current_data = sinc_data;
set(htext2,'string','Sinc');
get(axe);
end
end
% Push button callbacks. Each callback plots current_data in the
% specified plot type.
function surfbutton_Callback(~,~)
% Display surf plot of the currently selected data.
surf(current_data);
set(htext1,'string','Surf');
end
function meshbutton_Callback(~,~)
% Display mesh plot of the currently selected data.
mesh(current_data);
set(htext1,'string','Mesh');
end
function contourbutton_Callback(~,~)
% Display contour plot of the currently selected data.
contour(current_data);
set(htext1,'string','Contour');
end
end