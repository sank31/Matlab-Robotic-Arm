function varargout = tet1(varargin)
% TET1 MATLAB code for tet1.fig
%      TET1, by itself, creates a new TET1 or raises the existing
%      singleton*.
%
%      H = TET1 returns the handle to a new TET1 or the handle to
%      the existing singleton*.
%
%      TET1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TET1.M with the given input arguments.
%
%      TET1('Property','Value',...) creates a new TET1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tet1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tet1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tet1

% Last Modified by GUIDE v2.5 06-Dec-2020 18:48:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tet1_OpeningFcn, ...
                   'gui_OutputFcn',  @tet1_OutputFcn, ...
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


% --- Executes just before tet1 is made visible.
function tet1_OpeningFcn(hObject, ~, handles, varargin)
set(handles.text2, 'String', '90');
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tet1 (see VARARGIN)

% Choose default command line output for tet1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tet1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tet1_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
clear all;
global   record data play;
record  = 0;
play = 0;
data = []; 







function text1_Callback(~, ~, ~)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text1 as text
%        str2double(get(hObject,'String')) returns contents of text1 as a double


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, ~, ~)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text2_Callback(~, ~, ~)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text2 as text
%        str2double(get(hObject,'String')) returns contents of text2 as a double


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, ~, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(~, ~, handles)
% hObject    handle to slider1 (see GCBO)

 


ModelName = 'NOP';
    
     t1=get(handles.slider1,'value');
 disp(t1)
    set(handles.text2,'string',num2str(t1));
   
    set_param([ModelName '/Slider Gain'],'Gain',num2str(t1))
    pos1=t1;
%pos1=1-pos1; %For position inversion

global data record
if record == 1
    data = [data; 1 pos1];  
    
end 
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, ~, ~)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in rec.
function rec_Callback(~, ~, handles)
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


% --- Executes on button press in reset.
function reset_Callback(~, ~, handles)

set(handles.slider1,'Value', 90)
set(handles.text2,'String', '90')
set_param(['NOP' '/Slider Gain'],'Gain','90')

global record data p
record = 0;
data = [];
p = 0;
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in play.
function play_Callback(~, ~, handles)
global p data d1 s1
if p == 0
        errordlg('Robotic arm is busy','Record Null');  
elseif p == 1
    set(handles.play,'BackgroundColor', 'green')
   set_param(['NOP' '/Slider Gain'],'Gain','90')
    pause(1);
    [m,~] = size(data);
    disp(data)
    
    for i=1:m
        
        if data(i,1) == 1
           d1=data(i,2);
           disp(d1)
            set_param(['NOP' '/Slider Gain'],'Gain',num2str(d1))
            
            pause(1)
            end
        
    end
    set(handles.play,'BackgroundColor', 'white');
    
end
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
