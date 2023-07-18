function varargout = armsim(varargin)
% ARMSIM MATLAB code for armsim.fig
%      ARMSIM, by itself, creates a new ARMSIM or raises the existing
%      singleton*.
%
%      H = ARMSIM returns the handle to a new ARMSIM or the handle to
%      the existing singleton*.
%
%      ARMSIM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARMSIM.M with the given input arguments.
%
%      ARMSIM('Property','Value',...) creates a new ARMSIM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before armsim_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to armsim_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help armsim

% Last Modified by GUIDE v2.5 19-Dec-2020 12:23:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @armsim_OpeningFcn, ...
                   'gui_OutputFcn',  @armsim_OutputFcn, ...
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


% --- Executes just before armsim is made visible.
function armsim_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to armsim (see VARARGIN)

% Choose default command line output for armsim
set(handles.text1, 'String', '90');
set(handles.text2, 'String', '90');
set(handles.text3, 'String', '90');
set(handles.text4, 'String', '90');
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes armsim wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = armsim_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
set(handles.slider4,'Value', 90)
set(handles.slider3,'Value', 90)
set(handles.slider2,'Value', 90)
set(handles.slider1,'Value', 90)
set(handles.text1,'String', '90')
set(handles.text2,'String', '90')
set(handles.text3,'String', '90')
set(handles.text4,'String', '90')
set_param(['NOP' '/Slider Gain'],'Gain','90')
set_param(['NOP' '/Slider Gain1'],'Gain','90')
set_param(['NOP' '/Slider Gain2'],'Gain','90')
set_param(['NOP' '/Slider Gain3'],'Gain','90')
global record data p
record = 0;
data = [];
p = 0;
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in rec.
function rec_Callback(hObject, eventdata, handles)
global record data p
if record == 1
        set(handles.rec,'BackgroundColor','white');
        p = 1;
        record = 0;
elseif record == 0      
        %recording starts
        record = 1;
        data = [];
        set(handles.rec,'BackgroundColor', 'green');
end
% hObject    handle to rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
global p data d1 d2 d3 d4
if p == 0
        errordlg('Robotic arm is busy','Record Null');  
elseif p == 1
    set(handles.play,'BackgroundColor', 'green');
    set_param(['NOP' '/Slider Gain'],'Gain','90')
    pause(1);
%set_param(['NOP' '/Slider Gain1'],'Gain','90')
%pause(1);
%set_param(['NOP' '/Slider Gain2'],'Gain','90')
%pause(1);
%set_param(['NOP' '/Slider Gain3'],'Gain','90')
%pause(1);
   ModelName='NOP'
    [m,~] = size(data);
    disp(data)
    for i=1:m
        
        if data(i,1) == 1
           d1=data(i,2);
           disp(d1)
          
           %set_param(['NOP' '/Slider Gain'],'Gain',num2str(d1))
           disp(num2str(d1))
           
            set_param([ModelName '/Slider Gain'],'Gain',num2str(d1))
            set_param('NOP','SimulationCommand','update')
            pause(1)
       % elseif data(i,1) == 2
           % set_param(['NOP' '/Slider Gain1'],'Gain',data(i,2))
            %pause(0.5)
       % elseif data(i,1) == 3
            %set_param(['NOP' '/Slider Gain2'],'Gain',data(i,2))
            %pause(0.5)
       % elseif data(i,1) == 4
          % set_param(['NOP' '/Slider Gain3'],'Gain',data(i,2))
           % pause(0.5)
        end
        
    end
    set(handles.play,'BackgroundColor', 'white');
    
end
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
ModelName = 'NOP';
    
     t1=get(handles.slider1,'value');
    set(handles.text1,'string',num2str(t1));
    
   
 
   
    set_param([ModelName '/Slider Gain'],'Gain',num2str(t1))
    pos1=t1;
%pos1=1-pos1; %For position inversion

global data record
if record == 1
    data = [data; 1 pos1];
end
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


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
ModelName = 'NOP';
    
    
    
    
    t2=get(handles.slider2,'value');
    set(handles.text2,'string',num2str(t2));
    
    
    
 
    set_param([ModelName '/Slider Gain1'],'Gain',num2str(t2))
    
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


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
ModelName = 'NOP';
    
    
    
    t3=get(handles.slider3,'value');
    set(handles.text3,'string',num2str(t3));
    
   
 
   
    set_param([ModelName '/Slider Gain2'],'Gain',num2str(t3))
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
ModelName = 'NOP';
    
    
    
    t4=get(handles.slider4,'value');
    set(handles.text4,'string',num2str(t4));
    
    
    set_param([ModelName '/Slider Gain3'],'Gain',num2str(t4))
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
