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

% Last Modified by GUIDE v2.5 07-Aug-2018 08:59:19

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

function edit19_Callback(hObject, eventdata, handles)
% Px Radius for Voltage Region

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
val=round(get(handles.slider2,'Value'));
handles.slider2.Value=val;

handles.edit2.Value=val;
handles.edit2.String=num2str(val);
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
[data,dt,fname]=lsmopen;
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
set(handles.text25,'String',fname);

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


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
[gr,gc]=find(handles.imstd>0);
[pc,pr]=ginput(1);                                                                                                                                 
pc=round(pc);                                                                                                                                       
pr=round(pr);

% update text boxes
set(handles.edit17,'String',num2str(pc));
set(handles.edit18,'String',num2str(pr));

% output needed vars  
handles.gr=gr;
handles.gc=gc;
guidata(hObject,handles);


%% --- Executes on button press in Region Selector OK button CALCIUM
function pushbutton3_Callback(hObject, eventdata, handles)
data=handles.data;
imstd=handles.imstd;
gr=handles.gr;
gc=handles.gc;
pr=str2double(handles.edit9.String);
pc=str2double(handles.edit8.String);
dt=handles.dt;
maxrad=str2double(handles.txt_maxrad.String);
dto=str2double(handles.edit23.String); %detrend polynomial order
dt_enable = get(handles.checkbox10, 'Value'); % check if detrending is enabled.
LPF_enable = get(handles.checkbox8, 'Value'); % check if LPF is enabled
Fc=str2double(handles.edit21.String); % Cutoff Frequency

mode_selection = 1;

[avesig,time,radi]=region(data,gr,gc,pr,pc,dt,maxrad,mode_selection); %region plotter

avesig=double(avesig);

if dt_enable == true
    opol=dto; %detrend polynomial order
    time=time';
    [p,~,mu] = polyfit(time(:),avesig(:),opol);
    fy=polyval(p,time(:),[],mu);
    d_calcium=avesig(:)-fy;
else
    d_calcium=avesig; %skip detrending step
end

if LPF_enable == true
    Fs=1/dt;
    % % FIR 50th order Filtering
    % hb=100; %high band is 60 Hz
    % or=50; %50th order
    % a0=[1 1 0 0];
    % f0=[0 hb hb*1.25 Fs/2]./(Fs/2);
    % b = firpm(or,f0,a0);
    % a = 1;

    % IIR 5th order Butterworth  LPF
    n  = 5;    % Order
    Wn=(Fc/(Fs/2));
    [b,a] = butter(n,Wn);
    pre_calcium=filtfilt(b,a,d_calcium);
else
    pre_calcium=d_calcium;% skip preprocessing step
end

calcium=double((pre_calcium-min(pre_calcium))/(max(pre_calcium)-min(pre_calcium))); %normalize

axes(handles.axes1) 
hold off
plot(time,calcium);
xlabel('Time (s)')
ylabel('Fluorescence (AU)');
xlim([0 max(time)])
set(handles.radiobutton10,'Value',1);

axes(handles.axes3)
imagesc(imstd);
hold on
plot(gc(radi), gr(radi), 'k.');
axis image

% Exporting variables
handles.time=time;
handles.calcium=calcium;
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
xlim([0 max(time)])
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
% What peaks should be detected?
mode_selection = get(handles.popupmenu2, 'Value');

if mode_selection == 1 || 3 % Dual or Calcium
    signal=handles.calcium;
elseif mode_selection == 2 % Voltage only
    signal=handles.voltage;
end
    
time=handles.time;
thres=handles.edit1.Value;
mpd=round(handles.edit2.Value);

[num_peaks, locsa, upstroke_locs, t0_locs, depV, minimum, maximum, amp]=peak_detect(signal, thres, mpd);

axes(handles.axes1)
%hold off
%plot(time,signal)
%xlim([0 max(time)])
%xlabel('Time (s)')
%ylabel('Fluorescence (AU)');
hold on
baseline=linspace(minimum, minimum, length(time));
% peakavg=linspace(maximum, maximum, length(time));
plot(time,baseline,'b-','linewidth',1)
% plot(time,peakavg,'m-','linewidth',1)
plot(time,linspace(amp,amp,length(time)));
hold off

axes(handles.axes1)
hold on
plot(time(locsa),signal(locsa),'mo','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');

% Exporting data
handles.text14.String=num2str(num_peaks);
guidata(hObject,handles);

% --- Executes on button press in pushbutton6.Processing GO. Main Loop Here
function summary=pushbutton6_Callback(hObject, eventdata, handles)
clc

mode_selection = get(handles.popupmenu2, 'Value');

if mode_selection ==  1 % Dual
    processCalcium(hObject, eventdata, handles)
    processVoltage(hObject, eventdata, handles)
elseif mode_selection == 2 % Voltage only
    processVoltage(hObject, eventdata, handles)
elseif mode_selection == 3 % Calcium only
    processCalcium(hObject, eventdata, handles)
end

function processCalcium(hObject, eventdata, handles)
% Loading in data
calcium=handles.calcium;
time=handles.time;
fps=handles.fps;
thres=handles.edit1.Value;
mpd=round(handles.edit2.Value);
% Detect peaks in calcium signal
[num_peaks, locsa, upstroke_locs, t0_locs, depV, minimum, maximum, amp]=peak_detect(calcium, thres, mpd);
axes(handles.axes1)
hold on
% Proces the calcium signal
type=0; % for calcium
[CRtab,  CMtab]=process(locsa, upstroke_locs,t0_locs,depV,calcium,time,fps,minimum,maximum,type);
handles.CRtab=CRtab; % individual results for calcium
handles.CMtab=CMtab; % mean results row for calcium
guidata(hObject,handles);

function processVoltage(hObject, eventdata, handles)
voltage=handles.voltage;
time=handles.time;
fps=handles.fps;
thres=handles.edit1.Value;
mpd=round(handles.edit2.Value);
% Detect peaks in voltage signal
[num_peaks, locsa, upstroke_locs, t0_locs, depV, minimum, maximum, amp]=peak_detect(voltage, thres, mpd);
axes(handles.axes1)
hold on
plot(time,voltage,'r');
xlim([0 max(time)])
% Process the voltage signal
type=1; % for voltage
[VRtab,VMtab]=process(locsa, upstroke_locs,t0_locs,depV,voltage,time,fps,minimum,maximum,type);
handles.VRtab=VRtab; % individual results for calcium
handles.VMtab=VMtab; % mean results row for calcium
guidata(hObject,handles);


function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)mean
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
calcium=handles.calcium;
time=1:1:length(calcium);
axes(handles.axes1)
hold off
plot(time,calcium)
xlim([min(time) max(time)])
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
time=handles.time;
mode_selection = get(handles.popupmenu2, 'Value');

if mode_selection ==  1 % Dual
    calcium=handles.calcium;
    epoch=calcium(pt1:pt2);
    epoch=(epoch-min(epoch))/(max(epoch)-min(epoch));
    voltage=handles.voltage;
    v_epoch=voltage(pt1:pt2);
    v_epoch=(v_epoch-min(v_epoch))/(max(v_epoch)-min(v_epoch));
    handles.calcium=epoch;
    handles.voltage=v_epoch;
    handles.time=time(pt1:pt2);
    guidata(hObject,handles);
    axes(handles.axes1)
    plotEpoch(v_epoch, pt1, pt2, time)
    set(handles.radiobutton10,'Value',1);


elseif mode_selection == 2 % Voltage only
    voltage=handles.voltage;
    v_epoch=voltage(pt1:pt2);
    v_epoch=(v_epoch-min(v_epoch))/(max(v_epoch)-min(v_epoch));
    handles.voltage=v_epoch;
    handles.time=time(pt1:pt2);
    guidata(hObject,handles);
    axes(handles.axes1)
    plotEpoch(v_epoch, pt1, pt2, time)
    set(handles.radiobutton10,'Value',1);


elseif mode_selection == 3 % Calcium only
    calcium=handles.calcium;
    epoch=calcium(pt1:pt2);
    epoch=(epoch-min(epoch))/(max(epoch)-min(epoch));
    handles.calcium=epoch;
    handles.time=time(pt1:pt2);
    guidata(hObject,handles);
    axes(handles.axes1)
    plotEpoch(epoch, pt1, pt2, time)
    set(handles.radiobutton10,'Value',1);


end

function plotEpoch(epoch, pt1, pt2, time)
    hold off
    plot(time(pt1:pt2),epoch)
    xlim([time(pt1) time(pt2)])
    xlabel('Time (sec)')
    ylabel('Fluorescence (AU)');

% --- Calcium Individual Results
function pushbutton10_Callback(hObject, eventdata, handles)
CRtab=handles.CRtab;
assignin('base','CRtab',CRtab)
openvar('CRtab')

% --- Calcium Mean Results
function pushbutton17_Callback(hObject, eventdata, handles)
CMtab=handles.CMtab;
assignin('base','CMtab',CMtab)
openvar('CMtab')

% --- Voltage Individual Results
function pushbutton24_Callback(hObject, eventdata, handles)
VRtab=handles.VRtab;
assignin('base','VRtab',VRtab)
openvar('VRtab')

% --- Voltage Mean Results
function pushbutton22_Callback(hObject, eventdata, handles)
VMtab=handles.VMtab;
assignin('base','VMtab',VMtab)
openvar('VMtab')

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


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
[data,dt]=nd2open;
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

function Untitled_6_Callback(hObject, eventdata, handles)
[trace,dt,fname]=txtopen;

fps=1/dt;

set(handles.text23,'String',num2str(dt));
set(handles.text24,'String',num2str(1/dt));
set(handles.text25,'String',fname);

avesig=trace;

time=0:dt:length(avesig)*dt-dt;

axes(handles.axes1) 
hold off
plot(time,avesig);
xlabel('Time (s)')
ylabel('Fluorescence (AU)');
set(handles.radiobutton10,'Value',1);


handles.fps=fps;
handles.dt=dt;
handles.calcium=avesig;
handles.time=time;
guidata(hObject,handles)



% --------------------------------------------------------------------
function measurement_settings_Callback(hObject, eventdata, handles)
childsettings
% hObject    handle to measurement_settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes on button press in pushbutton15. % BATCH PROCESSING
function pushbutton15_Callback(hObject, eventdata, handles)
pname=handles.pname;
root=handles.edit16.String;
nFiles=str2double(handles.edit15.String);

gr=handles.gr;
gc=handles.gc;
pr=str2double(handles.edit9.String);
pc=str2double(handles.edit8.String);
maxrad=str2double(handles.txt_maxrad.String);
mode_selection = get(handles.popupmenu2, 'Value');

thres=handles.edit1.Value;
mpd=round(handles.edit2.Value);

% What files do you want to load?
files=1:42;
%files=[32:40]; % specify specific file vector



for filenum=files;   
    try
        [ret, data, fps, ~, ~, ~]=sifopen([pname, root,'_',num2str(filenum),'.sif']);
        if ret==0
            break
            disp('problem with locating file')
        end
        dt=1/fps;

        [avesig,time,radi]=region(data,gr,gc,pr,pc,dt, maxrad, mode_selection);
        axes(handles.axes1) 
        hold off
        plot(time,avesig);
        xlabel('Time (s)')
        ylabel('Fluorescence (AU)');
        xlim([0 max(time)])
        set(handles.radiobutton10,'Value',1);
        
        hold on
        [num_peaks, locsa, upstroke_locs, t0_locs, depV, minimum, maximum, amp]=peak_detect(avesig, thres, mpd);
        [~,~,mean_results]=process(locsa, upstroke_locs,t0_locs,depV,avesig,time,fps,minimum,maximum);
        pause(0.5)
        batch_results(filenum,:)=mean_results;
        set(handles.text15,'String',num2str(filenum));
    
    catch   
        batch_results(filenum,:)=zeros(size(mean_results));        
        set(handles.text15,'String',num2str(filenum));          
    end
    
end

Btab=array2table(batch_results,'VariableNames',{'Vmax','UpTime90','TauFall','CaD30','APD80','CaD30d80','D_F0','F1_F0','CL','FD_F0','LD_F0'});
handles.Btab=Btab; % batch results table with mean from each file
guidata(hObject,handles);

%% Menu Items
function advanced_Callback(hObject, eventdata, handles)
% hObject    handle to advanced (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ----------------ANDOR SIF OPEN-------------------------------------------

function menu_andor_Callback(hObject, eventdata, handles)

[~, pdata, fps, ~, fname,pname]=sifopen;
dt=1/fps;
data=pdata(:,:,2:end); % Remove the first frame.

imstd=transform_image(data);

set(handles.text23,'String',num2str(dt));
set(handles.text24,'String',num2str(1/dt));
set(handles.text25,'String',[pname, fname]);

axes(handles.axes3)
hold off
imagesc(imstd);
set(gca, 'XTick', []);
set(gca, 'YTick', []);
axis image;
axis off;

handles.imstd=imstd;
handles.data=data;
handles.dt=dt;
handles.fps=fps;
handles.pname=pname; % we have to export the path name so that batch can use it later
guidata(hObject,handles)

function imstd=transform_image(data)

imstd=zeros(size(data,1),size(data,2));                                                                                                                 
for i=1:size(data,1)                                                
    % In each column of each row
    for j=1:size(data,2)                                                                                                                                   
    % That point equals the standard deviation of all the frames in that same column and row index
    imstd(i,j)=std(data(i,j,:));                                                                                                                         
    end
end



% --- Executes on button press in pushbutton18. % BATCH RESULTS BUTTON
function pushbutton18_Callback(hObject, eventdata, handles)
Btab=handles.Btab;
assignin('base','Btab',Btab)
openvar('Btab')


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% --- Executes on button press in Region Selector OK button VOLTAGE
function pushbutton21_Callback(hObject, eventdata, handles)
data=handles.data;
imstd=handles.imstd;
gr=handles.gr;
gc=handles.gc;
pr=str2double(handles.edit18.String);
pc=str2double(handles.edit17.String);
dt=handles.dt;
maxrad=str2double(handles.edit19.String);
dto=str2double(handles.edit24.String); %detrend polynomial order
dt_enable = get(handles.checkbox11, 'Value'); % check if detrending is enabled.
LPF_enable = get(handles.checkbox9, 'Value'); % check if LPF is enabled
Fc=str2double(handles.edit22.String); % Cutoff Frequency

mode_selection = 2; % This inverts the signal for voltage when choosing the region

[avesig,time,radi]=region(data,gr,gc,pr,pc,dt,maxrad,mode_selection); %region plotter
avesig=double(avesig);

if dt_enable == true
    opol=dto; %detrend polynomial order
    time=time';
    [p,~,mu] = polyfit(time(:),avesig(:),opol);
    fy=polyval(p,time(:),[],mu);
    d_voltage=avesig(:)-fy;
else
    d_voltage=avesig; %skip detrending step
end

if LPF_enable == true
    Fs=1/dt;
    % % FIR 50th order Filtering
    % hb=100; %high band is 60 Hz
    % or=50; %50th order
    % a0=[1 1 0 0];
    % f0=[0 hb hb*1.25 Fs/2]./(Fs/2);
    % b = firpm(or,f0,a0);
    % a = 1;

    % IIR 5th order Butterworth  LPF
    n  = 5;    % Order
    Wn=(Fc/(Fs/2));
    [b,a] = butter(n,Wn);
    pre_voltage=filtfilt(b,a,d_voltage);
else
    pre_voltage=d_voltage;% skip preprocessing step
end

voltage=double((pre_voltage-min(pre_voltage))/(max(pre_voltage)-min(pre_voltage))); % normalize

axes(handles.axes1) 
hold on
plot(time(:),voltage,'r');
xlabel('Time (s)')
ylabel('Fluorescence (AU)');
xlim([0 max(time)])
set(handles.radiobutton10,'Value',1);

axes(handles.axes3)
imagesc(imstd);
hold on
plot(gc(radi), gr(radi), 'k.');
axis image

% Exporting variables
handles.time=time;
handles.voltage=voltage;
guidata(hObject,handles);


% PCL entered here to calculate the recommended lockout time.
function edit20_Callback(hObject, eventdata, handles)
fps=handles.fps;
pcl=str2double(handles.edit20.String);

%lockout time calculated
lot_calc=(pcl/1000)*fps;
set(handles.lot_rec,'String',num2str(floor(lot_calc)));


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton26.
% Differential Results for Vm and Ca
function pushbutton26_Callback(hObject, eventdata, handles)
CRtab=handles.CRtab;
VRtab=handles.VRtab;

CaD80_APD80=CRtab.CaD80-VRtab.APD80;
CaT_AP_actTime=CRtab.ActTime-VRtab.ActTime;
Difftab=array2table([CaD80_APD80,CaT_AP_actTime],'VariableNames',{'CaD80_APD80','ActTimeDiff'});

assignin('base','Difftab',Difftab)
openvar('Difftab')


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
CRtab=handles.CRtab;
VRtab=handles.VRtab;

results(1,1)=mean(CRtab.CaD80-VRtab.APD80,1);
results(1,2)=mean(CRtab.ActTime-VRtab.ActTime,1);
results(2,1)=std(CRtab.CaD80-VRtab.APD80,1,1);
results(2,2)=std(CRtab.ActTime-VRtab.ActTime,1,1);
DiffMtab=array2table(results,'VariableNames',{'CaD80_APD80','ActTimeDiff'});

assignin('base','DiffMtab',DiffMtab)
openvar('DiffMtab')


% --- Executes on selection change in listbox1.
% File selection box
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton30.
% Change Folder Button under list box
function pushbutton30_Callback(hObject, eventdata, handles)

seed='/run/media/lab/Posnack-Heart/Mapping';
seldirec = uigetdir(seed,'Select Image Directory');

Infolder      = dir(seldirec);
fileList = {Infolder(~[Infolder.isdir]).name};
set(handles.listbox1,'Value',1); 
set(handles.listbox1,'String',fileList)
handles.seldirec=seldirec;
guidata(hObject,handles);

% --- Executes on button press in pushbutton32.
% Load files from the listbox
function pushbutton32_Callback(hObject, eventdata, handles)
seldirec=handles.seldirec;

contents = cellstr(get(handles.listbox1,'String'));
fileSelect=contents{get(handles.listbox1,'Value')};
source=[seldirec, '/', fileSelect];
[path, name, ext]=fileparts(source);

if ext == '.sif'
    [~, pdata, fps, ~, fname,pname]=sifopen(source);
    data=pdata(:,:,2:end); % Remove the first frame.
    dt=1/fps;
    handles.pname=pname; % we have to export the path name so that batch can use it later
elseif    ext == '.nd2'
    [data,dt]=nd2open(source);
    fps=1/dt;
end

imstd=transform_image(data);

set(handles.text23,'String',num2str(dt));
set(handles.text24,'String',num2str(1/dt));
set(handles.text25,'String',source);

axes(handles.axes3)
hold off
imagesc(imstd);
set(gca, 'XTick', []);
set(gca, 'YTick', []);
axis image;
axis off;

handles.imstd=imstd;
handles.data=data;
handles.dt=dt;
handles.fps=fps;
guidata(hObject,handles)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
axes(handles.axes1) 
cla


% --------------------------------------------------------------------
function tifmenu_Callback(hObject, eventdata, handles)
[preData,fps]=tifopen;
dt=1/fps;
data=double(preData);
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
% hObject    handle to tifmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
