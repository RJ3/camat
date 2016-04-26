function varargout = camat(varargin)
% CAMAT MATLAB code for camat.fig
%      CAMAT, by itself, creates a new CAMAT or raises the existing
%      singleton*.
%
%      H = CAMAT returns the handle to a new CAMAT or the handle to
%      the existing singleton*.
%
%      CAMAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAMAT.M with the given input arguments.
%
%      CAMAT('Property','Value',...) creates a new CAMAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before camat_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to camat_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help camat

% Last Modified by GUIDE v2.5 22-Apr-2016 16:23:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @camat_OpeningFcn, ...
                   'gui_OutputFcn',  @camat_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before camat is made visible.
function camat_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to camat (see VARARGIN)

% Choose default command line output for camat
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = camat_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.results;


% UIWAIT makes camat wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on slider movement. THRESHOLD PEAK DETECTOR SLIDER
function slider1_Callback(hObject, eventdata, handles)
handles.edit1.Value=get(handles.slider1,'Value');
handles.edit1.String=num2str(get(handles.slider1,'Value'));
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement. LOCKOUT PEAK DETECTOR SLIDER
function slider2_Callback(hObject, eventdata, handles)
handles.edit2.Value=get(handles.slider2,'Value');
handles.edit2.String=num2str(get(handles.slider2,'Value'));
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
handles.slider1.Value=str2double(get(handles.edit1,'String'));
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
handles.slider2.Value=str2double(get(handles.edit2,'String'));
handles.edit2.Value=str2double(get(handles.edit2,'String'));
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function filemenu_Callback(hObject, eventdata, handles)
% hObject    handle to filemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function imstd=Untitled_3_Callback(hObject, eventdata, handles)
[data,dt]=lsmopen;
imstd=zeros(size(data,1),size(data,2));                                                                                                                 
for i=1:size(data,1)                                                
    % In each column of each row
    for j=1:size(data,2)                                                                                                                                   
    % That point equals the standard deviation of all the frames in that same column and row index
    imstd(i,j)=std(data(i,j,:));                                                                                                                         
    end
end
axes(handles.axes3) 
hold off
imagesc(imstd);
axis image;
axis off;

fps=1/dt;

set(handles.text23,'String',num2str(dt));
set(handles.text24,'String',num2str(1/dt));

handles.imstd=imstd;
handles.data=data;
handles.dt=dt;
handles.fps=fps;
guidata(hObject,handles)

return
% [AX,H1,H2]=plotyy(time,a(1,:),time,a(8,:));
% set(H1,'linewidth',2);
% set(H2,'linewidth',2);
% set(get(AX(1),'\DeltaOD CytoA','FontSize',14,'FontWeight', 'Bold')
% set(get(AX(2),'Ylabel'),'String','\DeltaOD Myoglobin','FontSize',14,...
%     'FontWeight', 'Bold','rot',-90,'VerticalAlignment','bottom')
% set(AX(1),'FontSize',14, 'XTick', 0:90:max(time),'xlim', [0 max(time)])
% set(AX(2),'FontSize',14, 'XTick', 0:90:max(time),'xlim', [0 max(time)])
% xlabel('Time (sec)','FontSize',14,'FontWeight', 'Bold')
% imagesc(imstd);colorbar;axis image; 

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[gr,gc]=find(handles.imstd>0);
[pc,pr]=ginput(1);                                                                                                                                 
pc=round(pc);                                                                                                                                       
pr=round(pr);

% update text boxes
set(handles.edit8,'String',num2str(pc));
set(handles.edit9,'String',num2str(pr));

% output needed vars  
handles.gr=gr;
handles.gc=gc;
guidata(hObject,handles);

%% --- Executes on button press in Region Selector OK button
function pushbutton3_Callback(hObject, eventdata, handles)
data=handles.data;
imstd=handles.imstd;
gr=handles.gr;
gc=handles.gc;
pr=str2double(handles.edit9.String);
pc=str2double(handles.edit8.String);
dt=handles.dt;

% Find all the indices where the the previous is less than the txt_maxrad
maxrad=str2double(handles.txt_maxrad.String);
rad=sqrt((gr-pr).^2 + (gc-pc).^2);
radi=find(rad<=maxrad); 

avesig=zeros(size(data,3),1);                                                                                                                       
for i=1:length(radi)
    % for each radi, find the gr and gc for that for all frames. Use those indices for the data, and get rid of all the singleton dimensions there.
    pixsig=squeeze(data(gr(radi(i)),gc(radi(i)),:));                        
    % Add the avesid and pix sig.
    avesig=avesig+pixsig;                                                   
end

time=0:dt:length(avesig)*dt-dt;

axes(handles.axes1) 
hold off
plot(time,avesig);
xlabel('Time (s)')
ylabel('Fluorescence (AU)');
set(handles.radiobutton10,'Value',1);


axes(handles.axes3)
imagesc(imstd);
hold on
plot(gc(radi), gr(radi), 'k.');
axis image

% Exporting variables
handles.time=time;
handles.avesig=avesig;
guidata(hObject,handles);

% --- Executes on button press in radiobutton10. TIME (SEC)
function radiobutton10_Callback(hObject, eventdata, handles)
avesig=handles.avesig;
dt=handles.dt;
time=(1:length(avesig))*dt;
axes(handles.axes1)
hold off
plot(time,avesig)
xlab='Time (s)';
xlabel(xlab)
ylabel('Fluorescence (AU)');
handles.time=time;
handles.xlab=xlab;
guidata(hObject,handles);

% --- Executes on button press in radiobutton11. (FRAMES)
function radiobutton11_Callback(hObject, eventdata, handles)
avesig=handles.avesig;
time=1:1:length(avesig);
axes(handles.axes1)
hold off
plot(time,avesig)
xlab='Frames';
xlabel(xlab)
ylabel('Fluorescence (AU)');
handles.time=time;
handles.xlab=xlab;
guidata(hObject,handles);

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Test_Callback(hObject, eventdata, handles)
% hObject    handle to Test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function txt_maxrad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_maxrad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Time Selector (Pick button).
function pushbutton5_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function Untitled_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Peak Detection Procedure.
function pushbutton7_Callback(hObject, eventdata, handles)
%
avesig=handles.avesig;
time=handles.time;
thres=handles.edit1.Value;
mpd=round(handles.edit2.Value);

avesig_partialsmooth=double(avesig);
avesig_partialsmooth=smooth(avesig_partialsmooth,10,'sgolay',1);

amp=thres*max(avesig_partialsmooth);

% Determine the gradient of the smoothed signal for the t0 and max dep vel
grad=gradient(avesig_partialsmooth);
% Find the peaks in the 2nd derivative, these correspond to the beginning
% of the upstrokes (t0);
[~,t0_locs] = findpeaks3(gradient(smooth(grad)),'MINPEAKHEIGHT',0.4*max(gradient(grad)),...
    'MINPEAKDISTANCE',mpd);

% Find the maxima of the smoothed averaged signal
[~,locsa] = findpeaks3(avesig_partialsmooth,'MINPEAKHEIGHT',amp,'MINPEAKDISTANCE',mpd);

% Find all the minima for the smooth averaged signal
[~,~,~,imin] = extrema(avesig_partialsmooth);
% Sort the minima by ascending
imin2=sort(imin,'ascend');

% Find the peaks ~ corresponds to upstroke and max dep vel
[depV,upstroke_locs] = findpeaks3(grad,'MINPEAKHEIGHT',0.4*max(grad),'MINPEAKDISTANCE',mpd);

%% Normalize the signal for 100% and 30% calculations
allpoints=sort(avesig);
nump=length(allpoints);
bottom=floor(nump*0.35); % this was 0.35 before
maximum=mean(allpoints(end-20:end));
% minimum=mean(allpoints(1:bottom));
minimum=mean(avesig(1:t0_locs(1)));

axes(handles.axes1)
hold off
plot(time,avesig)
xlabel('Time (s)')
ylabel('Fluorescence (AU)');
hold on
baseline=linspace(minimum, minimum, length(time));
% peakavg=linspace(maximum, maximum, length(time));
plot(time,baseline,'b-','linewidth',1)
% plot(time,peakavg,'m-','linewidth',1)
plot(time,linspace(amp,amp,length(time)));
hold off

axes(handles.axes1)
hold on
plot(time(locsa),avesig(locsa),'mo','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');

% Exporting data
handles.text14.String=num2str(length(locsa));
handles.locsa=locsa;
handles.upstroke_locs=upstroke_locs;
handles.t0_locs=t0_locs;
handles.depV=depV;
handles.minimum=minimum;
handles.maximum=maximum;
guidata(hObject,handles);

% --- Executes on button press in pushbutton6.Processing GO. Main Loop Here
function pushbutton6_Callback(hObject, eventdata, handles)
% Loading in data
locsa=handles.locsa;
upstroke_locs=handles.upstroke_locs;
t0_locs=handles.t0_locs;
depV=handles.depV;
avesig=handles.avesig;
time=handles.time;
fps=handles.fps;
minimum=handles.minimum;
maximum=handles.maximum;

% Loops for finding points
trans=1;
lasttrans=trans+1;

if length(locsa)>length(upstroke_locs)
        looplength=length(upstroke_locs);
elseif length(upstroke_locs)>length(locsa)
        looplength=length(locsa);        
elseif length(upstroke_locs)==length(locsa)
        looplength=length(locsa);
end

for i=1:looplength-1
    
% Return the Upstroke Point

    loct0=t0_locs(i);

lup=find(upstroke_locs>loct0,1,'first');
locup=upstroke_locs(lup);

% Return the Peak Point    
lp=find(locsa>locup,1,'first');
locpk=locsa(lp);

% Return the t0 Point
% lb2=find(imin2<locup,1,'last');
% loct0=imin2(lb2);

% Return to Baseline Point
% lb=find(avesig(locpk:end)<=(avesig(locpk)-((avesig(locpk)-avesig(loct0))*0.95)),1,'first');
[lb,~]=find(avesig(locpk:(t0_locs(i+1)-1))<minimum,1,'last');

if isempty(lb)
    locbase=t0_locs(i+1)-2;
else
    locbase=lb+locpk-1;
end

if loct0<locup<locpk<locbase
%     disp('okay')
elseif  loct0>locup
        loct0=t0_locs(i+1);
end

%Average the last 3 points to compensate for noise in the baseline
% avg_base=mean([avesig(locbase) avesig(locbase-1) avesig(locbase-3)]);
normalized=(avesig(locpk:locbase)-avesig(locbase))/(avesig(locpk)-avesig(locbase));

[cad50_endpre,~]=find(normalized<=0.495,1,'first');
[cad90_endpre,~]=find(normalized<=0.195,1,'first'); %Cad80 or 90
[lp2pre,~]=find(normalized<=0.695,1,'first');

cad50_end=cad50_endpre+locpk;
cad90_end=cad90_endpre+locpk;
lp2=lp2pre+locpk;

%% Plotting
% Plot the points of interest
axes(handles.axes1)
hold on
% Plot the t0 Point
plot(time(loct0),avesig(loct0),'m^','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');
% Plot the Initialize Upstroke Point
plot(time(locup),avesig(locup),'ro','Markersize',8,'MarkerFaceColor','c','MarkerEdgeColor','k');
% Plot the Peak Point
plot(time(locpk),avesig(locpk),'mo','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');
% plot(time(lp1),avesig(lp1),'m^','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','m');
plot(time(lp2),avesig(lp2),'mv','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');
% Plot the cad50 ending
plot(time(cad50_end),avesig(cad50_end),'cs','Markersize',8,'MarkerFaceColor','c','MarkerEdgeColor','k');
% Plot the cad90 ending
plot(time(cad90_end),avesig(cad90_end),'cs','Markersize',8,'MarkerFaceColor','c','MarkerEdgeColor','k');
% Plot the Return to Baseline Point
plot(time(locbase),avesig(locbase),'yo','Markersize',8,'MarkerFaceColor','y','MarkerEdgeColor','k');

%% Main Fitting Functions
% Downstroke exponential (TauFall)
X=avesig(lp2:locbase);
X=double(X);
Tpre=(lp2:locbase)'-lp2;
T=linspace(0,length(Tpre)*(1/fps),length(Tpre))';

downstroke = @(params,T) params(1).*(exp(-params(3).*T))+params(2);
x0 = [100; 200; 0]; % Old Camera
% x0 = [200; 3000; 10]; % New Camera
options=optimset('Display','off','MaxFunEvals', 10000,'MaxIter',10000,...
    'Algorithm','levenberg-marquardt');
[params] = lsqcurvefit(downstroke,x0,T,X,[],[],options);
A=params(1);B=params(2);kFall=params(3);
recoverypred=A.*(exp(-kFall.*T))+B;

axes(handles.axes1)
hold on
plot(time(lp2:locbase),recoverypred,'g-','linewidth',2);

axes(handles.axes2)
hold off
plot(time(lp2:locbase),avesig(lp2:locbase),'o');
hold on
plot(time(lp2:locbase),recoverypred,'g-','linewidth',2);

%% Results Cell for single file analysis

results(trans,1)=depV(trans);
results(trans,2)=(time(locpk)-time(loct0));
results(trans,3)=(1/kFall)*1000;
results(trans,4)=(time(lp2)-time(loct0)); % CaD30
results(trans,5)=(time(cad50_end)-time(loct0)); % CaD50
results(trans,6)=(time(cad90_end)-time(loct0)); % CaD90

results(trans,7)=avesig(locpk);
results(trans,8)=avesig(locbase);
results(trans,9)=avesig(locpk)/avesig(locbase);

results(trans,10)=time(locsa(lp+1))-time(locpk);

Rtab=array2table(results,'VariableNames',{'MaxVel','TTP','TauFall','CaD30','CaD50','CaD90','F1','F0','F1F0','PeakTimeDiff'});

trans=trans+1;
clearvars X T A B kFall kRise recoverywin locbase loct0
end

handles.results=results;
handles.Rtab=Rtab;
guidata(hObject,handles);


function txt_maxrad_Callback(hObject, eventdata, handles)



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8. EPOCH SELECTOR BUTTON
function pushbutton8_Callback(hObject, eventdata, handles)
% Make sure you plot in Frames first, before you pick the epoch.
avesig=handles.avesig;
time=1:1:length(avesig);
axes(handles.axes1)
hold off
plot(time,avesig)
xlab='Frames';
xlabel(xlab)
ylabel('Fluorescence (AU)');
set(handles.radiobutton11,'Value',1);

[pt,~]=ginput(2);                                                                                                                                 
pt1=round(pt(1));                                                                                                                                       
pt2=round(pt(2));

% update text boxes
set(handles.edit12,'String',num2str(pt1));
set(handles.edit13,'String',num2str(pt2));


% --- Executes on button press in pushbutton9. EPOCH OK BUTTON
function pushbutton9_Callback(hObject, eventdata, handles)
pt1=str2double(handles.edit12.String);
pt2=str2double(handles.edit13.String);
avesig=handles.avesig;
time=handles.time;

epoch=avesig(pt1:pt2);
axes(handles.axes1)
hold off
plot(time(pt1:pt2),epoch)
xlabel('Time (sec)')
ylabel('Fluorescence (AU)');
set(handles.radiobutton10,'Value',1);


handles.avesig=epoch;
handles.time=time(pt1:pt2);
guidata(hObject,handles);

% --- Executes on button press in pushbutton10. Open Results Variable
function pushbutton10_Callback(hObject, eventdata, handles)
Rtab=handles.Rtab;
assignin('base','Rtab',Rtab)
openvar('Rtab')

% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
