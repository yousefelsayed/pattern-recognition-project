function varargout = simple_gui(varargin)
% SIMPLE_GUI MATLAB code for simple_gui.fig
%      SIMPLE_GUI, by itself, creates a new SIMPLE_GUI or raises the existing
%      singleton*.
%
%      H = SIMPLE_GUI returns the handle to a new SIMPLE_GUI or the handle to
%      the existing singleton*.
%
%      SIMPLE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMPLE_GUI.M with the given input arguments.
%
%      SIMPLE_GUI('Property','Value',...) creates a new SIMPLE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simple_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simple_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simple_gui

% Last Modified by GUIDE v2.5 10-Oct-2017 17:49:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simple_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @simple_gui_OutputFcn, ...
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


% --- Executes just before simple_gui is made visible.
function simple_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simple_gui (see VARARGIN)

% Choose default command line output for simple_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simple_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Set the "SelectedChannel" variable to the current selected item 
str = get(handles.popChannel,'String') ;
val = get(handles.popChannel,'Value');
handles.SelectedChannel = str{val};

% Set the "Result" variable to empty
handles.Result = [];
% Save the handles structure.
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = simple_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnOpenImage.
function btnOpenImage_Callback(hObject, eventdata, handles)
% hObject    handle to btnOpenImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Open the image and save it in the "handles" struct
handles.Image = imread('D:\Fcis\Fourth Year\Image Processing\tasks\DAY-II CASES\PRIMITIVE\TestImages\cat55.bmp');
% Set current drawing axes to "axes1"
axes(handles.axes1);
% Display the image
imshow(handles.Image);

% Enable the other buttons
set(handles.btnApply, 'Enable', 'on');
set(handles.btnBrightness, 'Enable', 'on');
set(handles.btnDisplayChannel, 'Enable', 'on');
set(handles.btnTranslate, 'Enable', 'on');
set(handles.btnNot,'Enable','on');
set(handles.btnRotate,'Enable','on');
set(handles.btnSheer,'Enable','on');
set(handles.btnScale,'Enable','on');
set(handles.btnGamma,'Enable','on');
set(handles.btnALL,'Enable','on');

set(handles.btnAddImages,'Enable','on');
% Save the handles structure.
guidata(hObject, handles);

% --- Executes on button press in btnSaveImage.
function btnSaveImage_Callback(hObject, eventdata, handles)
% hObject    handle to btnSaveImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%handles.Image=imread('jaguar.bmp');
imsave();

% --- Executes on button press in btnDisplayChannel.
function btnDisplayChannel_Callback(hObject, eventdata, handles)
% hObject    handle to btnDisplayChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Result = GetImageChannel(handles.Image, handles.SelectedChannel); 

% Set current drawing axes to "axes2"
axes(handles.axes2);
imshow(handles.Result);

% Save the handles structure.
guidata(hObject, handles);

% --- Executes on selection change in popChannel.
function popChannel_Callback(hObject, eventdata, handles)
% hObject    handle to popChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popChannel contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popChannel
str = get(hObject,'String') ;
val = get(hObject,'Value');
handles.SelectedChannel = str{val};

% Save the handles structure.
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btnBrightness.
function btnBrightness_Callback(hObject, eventdata, handles)

% Get brightness offset value from textbox
txtVal = get(handles.txtOffset, 'String');
offset = str2num(txtVal) ;

handles.ResultChar = Brightness(handles.Image,handles.RGB, offset);

%handles.Result = GetImageChannel(handles.Image, handles.SelectedChannel); 
% Save the handles structure.
% Set current drawing axes to "axes2"
axes(handles.axes2);
imshow(handles.ResultChar);
guidata(hObject, handles);



function txtOffset_Callback(hObject, eventdata, handles)
% hObject    handle to txtOffset (see GCBO)

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtOffset as text
%        str2double(get(hObject,'String')) returns contents of txtOffset as a double


% --- Executes during object creation, after setting all properties.
function txtOffset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnApply.
function btnApply_Callback(hObject, eventdata, handles)
% hObject    handle to btnApply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isempty(handles.Result))
    return;
end

% Set original "Image" to the "Result" image
handles.Image = handles.Result;

% Set current drawing axes to "axes1"
axes(handles.axes1);
imshow(handles.Image);

% Save the handles structure.
guidata(hObject, handles);


% --- Executes on button press in btnTranslate.
function btnTranslate_Callback(hObject, eventdata, handles)
% hObject    handle to btnTranslate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get X offset from textbox
% Get brightness offset value from textbox
txtVal = get(handles.txtXOffset, 'String');
Xoffset = str2num(txtVal) ;

% Call the function
handles.Result = Translate(handles.Image, Xoffset);

% Set current drawing axes to "axes2"
axes(handles.axes2);
imshow(handles.Result);

% Save the handles structure.
guidata(hObject, handles);



function txtXOffset_Callback(hObject, eventdata, handles)
% hObject    handle to txtXOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtXOffset as text
%        str2double(get(hObject,'String')) returns contents of txtXOffset as a double


% --- Executes during object creation, after setting all properties.
function txtXOffset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtXOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% --- Executes on selection change in selectedChannelChar.
function selectedChannelChar_Callback(hObject, eventdata, handles)
% hObject    handle to selectedChannelChar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject,'String') ;
val = get(hObject,'Value');
handles.SelectedChannelChar = str{val};

% Hints: contents = cellstr(get(hObject,'String')) returns selectedChannelChar contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selectedChannelChar


% --- Executes during object creation, after setting all properties.
function selectedChannelChar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selectedChannelChar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RGB.
function RGB_Callback(hObject, eventdata, handles)
% hObject    handle to RGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = get(hObject,'Value');
handles.RGB = val;

% Save the handles structure.
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns RGB contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RGB


% --- Executes during object creation, after setting all properties.
function RGB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnOpenImage2.
function btnOpenImage2_Callback(hObject, eventdata, handles)
% hObject    handle to btnOpenImage2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 txtVal = get(handles.txtPath, 'String');
 handles.Image2=imread(txtVal);
% Set current drawing axes to "axes1"
axes(handles.axes3);
% Display the image
imshow(handles.Image2);

% Enable the other buttons
set(handles.btnApply, 'Enable', 'on');
set(handles.btnBrightness, 'Enable', 'on');
set(handles.btnDisplayChannel, 'Enable', 'on');
set(handles.btnTranslate, 'Enable', 'on');
set(handles.btnNot,'Enable','on');
set(handles.btnAddImages,'Enable','on');
% Save the handles structure.
guidata(hObject, handles);


% --- Executes on button press in btnNot.
function btnNot_Callback(hObject, eventdata, handles)
% hObject    handle to btnNot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Notresult=NOT(handles.Image);
axes(handles.axes2);
imshow(handles.Notresult);
guidata(hObject, handles);


% --- Executes on button press in btnScale.
function btnScale_Callback(hObject, eventdata, handles)
% hObject    handle to btnScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
txtWidthStr=get(handles.txtWidth,'String');
txtWidthval=str2num(txtWidthStr);
txtHightstr=get(handles.txtHight,'String');
txtHightval=str2num(txtHightstr);
handles.ScaleResult=Scale(handles.Image,txtWidthval,txtHightval);
% Set current drawing axes to "axes2"
axes(handles.axes2);
%figur(1);
imshow(handles.ScaleResult);

% Save the handles structure.
guidata(hObject, handles);

% --- Executes on button press in btnRotate.
function btnRotate_Callback(hObject, eventdata, handles)
% hObject    handle to btnRotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Anglestr=get(handles.txtRotateAngle,'String');
AngleVal=str2num(Anglestr);
handles.RotateResult=Rotate(handles.Image,AngleVal);
% Set current drawing axes to "axes2"
axes(handles.axes2);
imshow(handles.RotateResult);

% Save the handles structure.
guidata(hObject, handles);

% --- Executes on button press in btnSheer.
function btnSheer_Callback(hObject, eventdata, handles)
% hObject    handle to btnSheer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

txtSheerXStr=get(handles.txtSheerX,'String');
txtSheerXval=str2num(txtSheerXStr);
txtSheerYstr=get(handles.txtSheerY,'String');
txtSheerYval=str2num(txtSheerYstr);
handles.ShearResult=Shear(handles.Image,txtSheerXval,txtSheerYval);
% Set current drawing axes to "axes2"
axes(handles.axes2);
imshow(handles.ShearResult);

% Save the handles structure.
guidata(hObject, handles);

function txtRotateAngle_Callback(hObject, eventdata, handles)
% hObject    handle to txtRotateAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtRotateAngle as text
%        str2double(get(hObject,'String')) returns contents of txtRotateAngle as a double


% --- Executes during object creation, after setting all properties.
function txtRotateAngle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtRotateAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtWidth_Callback(hObject, eventdata, handles)
% hObject    handle to txtWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtWidth as text
%        str2double(get(hObject,'String')) returns contents of txtWidth as a double


% --- Executes during object creation, after setting all properties.
function txtWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtHight_Callback(hObject, eventdata, handles)
% hObject    handle to txtHight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtHight as text
%        str2double(get(hObject,'String')) returns contents of txtHight as a double


% --- Executes during object creation, after setting all properties.
function txtHight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtHight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtSheerX_Callback(hObject, eventdata, handles)
% hObject    handle to txtSheerX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSheerX as text
%        str2double(get(hObject,'String')) returns contents of txtSheerX as a double


% --- Executes during object creation, after setting all properties.
function txtSheerX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSheerX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtSheerY_Callback(hObject, eventdata, handles)
% hObject    handle to txtSheerY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSheerY as text
%        str2double(get(hObject,'String')) returns contents of txtSheerY as a double


% --- Executes during object creation, after setting all properties.
function txtSheerY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSheerY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnALL.
function btnALL_Callback(hObject, eventdata, handles)
%Shear
txtSheerXStr=get(handles.SheerXall,'String');
txtSheerXval=str2num(txtSheerXStr);
txtSheerYstr=get(handles.SheerYall,'String');
txtSheerYval=str2num(txtSheerYstr);


%Rotate
Anglestr=get(handles.txtAngleAll,'String');
AngleVal=str2num(Anglestr);


%Scale
txtWidthStr=get(handles.NewWidth,'String');
txtWidthval=str2num(txtWidthStr);
txtHightstr=get(handles.NewHight,'String');
txtHightval=str2num(txtHightstr);


handles.AllResult=AllGeometricLinearTransformation(handles.Image,txtWidthval,txtHightval,AngleVal,txtSheerXval,txtSheerYval);
% Set current drawing axes to "axes2"
axes(handles.axes2);
imshow(handles.AllResult);

% Save the handles structure.
guidata(hObject, handles);


function txtAngleAll_Callback(hObject, eventdata, handles)
% hObject    handle to txtAngleAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtAngleAll as text
%        str2double(get(hObject,'String')) returns contents of txtAngleAll as a double


% --- Executes during object creation, after setting all properties.
function txtAngleAll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtAngleAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtWidthAll_Callback(hObject, eventdata, handles)
% hObject    handle to txtWidthAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtWidthAll as text
%        str2double(get(hObject,'String')) returns contents of txtWidthAll as a double


% --- Executes during object creation, after setting all properties.
function txtWidthAll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtWidthAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NewHight_Callback(hObject, eventdata, handles)
% hObject    handle to NewHight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NewHight as text
%        str2double(get(hObject,'String')) returns contents of NewHight as a double


% --- Executes during object creation, after setting all properties.
function NewHight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NewHight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SheerXall_Callback(hObject, eventdata, handles)
% hObject    handle to SheerXall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SheerXall as text
%        str2double(get(hObject,'String')) returns contents of SheerXall as a double


% --- Executes during object creation, after setting all properties.
function SheerXall_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SheerXall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SheerYall_Callback(hObject, eventdata, handles)
% hObject    handle to SheerYall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SheerYall as text
%        str2double(get(hObject,'String')) returns contents of SheerYall as a double


% --- Executes during object creation, after setting all properties.
function SheerYall_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SheerYall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnGamma.
function btnGamma_Callback(hObject, eventdata, handles)
% hObject    handle to btnGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
txtVal = get(handles.txtGamma, 'String');
offset = str2num(txtVal) ;

handles.ResultChar = Gamma(handles.Image, offset);

%handles.Result = GetImageChannel(handles.Image, handles.SelectedChannel); 
% Save the handles structure.
% Set current drawing axes to "axes2"
axes(handles.axes2);
imshow(handles.ResultChar);
guidata(hObject, handles);


function txtGamma_Callback(hObject, eventdata, handles)
% hObject    handle to txtGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtGamma as text
%        str2double(get(hObject,'String')) returns contents of txtGamma as a double


% --- Executes during object creation, after setting all properties.
function txtGamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnAddImages.
function btnAddImages_Callback(hObject, eventdata, handles)

handles.AddResult=AddTwoImages(handles.Image,handles.Image2);
axes(handles.axes2);
imshow(handles.AddResult);
guidata(hObject, handles);


function txtPath_Callback(hObject, eventdata, handles)
% hObject    handle to txtPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPath as text
%        str2double(get(hObject,'String')) returns contents of txtPath as a double


% --- Executes during object creation, after setting all properties.
function txtPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NewWidth_Callback(hObject, eventdata, handles)
% hObject    handle to NewWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NewWidth as text
%        str2double(get(hObject,'String')) returns contents of NewWidth as a double


% --- Executes during object creation, after setting all properties.
function NewWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NewWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
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



