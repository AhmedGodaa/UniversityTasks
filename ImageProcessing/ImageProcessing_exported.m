classdef ImageProcessing_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        ColourSystemsTab                matlab.ui.container.Tab
        colourSystem_resetBtn           matlab.ui.control.Button
        FileSavedSuccesfulyLabel        matlab.ui.control.Label
        ColourScheme_TextField          matlab.ui.control.EditField
        ycbcrButton                     matlab.ui.control.Button
        HSIButton                       matlab.ui.control.Button
        Save_For_colourSystem           matlab.ui.control.Button
        BinaryButton                    matlab.ui.control.Button
        GrayButton                      matlab.ui.control.Button
        Load_For_colourSystem           matlab.ui.control.Button
        ColourSystem_IMG                matlab.ui.control.UIAxes
        ColourSystem_UpdatedIMGSHOW     matlab.ui.control.UIAxes
        Resize_Tab                      matlab.ui.container.Tab
        Resize_Btn_reset                matlab.ui.control.Button
        FileSavedSuccesfulyLabel_2      matlab.ui.control.Label
        Resize_TextFeild                matlab.ui.control.EditField
        Resize_Button_Save              matlab.ui.control.Button
        HeightEditField                 matlab.ui.control.NumericEditField
        HeightEditFieldLabel            matlab.ui.control.Label
        Resize_Btn_Apply                matlab.ui.control.Button
        WidthEditField                  matlab.ui.control.NumericEditField
        WidthEditFieldLabel             matlab.ui.control.Label
        Resize_Button_Load              matlab.ui.control.Button
        Resize_Uploaded_Img_Window      matlab.ui.control.UIAxes
        Resize_Updated_Img_Window       matlab.ui.control.UIAxes
        EnhancmentTab                   matlab.ui.container.Tab
        RemoveBlur                      matlab.ui.control.Button
        RemoveNoiseButton               matlab.ui.control.Button
        ContrastSliderLabel             matlab.ui.control.Label
        Enhancment_Noise_button         matlab.ui.control.Button
        Enhancment_blur_button          matlab.ui.control.Button
        FileSavedSuccesfulyLabel_3      matlab.ui.control.Label
        Enhancment_FIleName_TextField   matlab.ui.control.EditField
        Enhancment_Save                 matlab.ui.control.Button
        Enhancment_Btn_Load             matlab.ui.control.Button
        Enhancment_Reset_btn            matlab.ui.control.Button
        imgEnchancment_applyBTN         matlab.ui.control.Button
        Enhancment_Slider_constrast     matlab.ui.control.Slider
        Enhancment_Auto_btn             matlab.ui.control.Button
        Label                           matlab.ui.control.Label
        ImageEnhancement_Img_window_changed  matlab.ui.control.UIAxes
        ImageEnhancement_Img_window     matlab.ui.control.UIAxes
        SegmentationTab                 matlab.ui.container.Tab
        Segmentaion_Reset_btn           matlab.ui.control.Button
        Segmentation_Btn_DetectSegment  matlab.ui.control.Button
        FileSavedSuccesfulyLabel_4      matlab.ui.control.Label
        Segmentation_Btn_DetectFace     matlab.ui.control.Button
        Segmentation_FIleName_TextField  matlab.ui.control.EditField
        Segmentation_Save               matlab.ui.control.Button
        Segmentation_Btn_Load           matlab.ui.control.Button
        Segmentation_Img_window_changed  matlab.ui.control.UIAxes
        Segmentation_Img_window         matlab.ui.control.UIAxes
    end

    
    properties (Access = public)
                     

%%% Colour system 
         ColourSystem_IMG_Path= "" ; 
         ColourSystem_IMG_FILE = "" ; 
         ColourSystem_tempImg="" ; 
        

         %%%%%%%%%%%%%%%%%%%%%%%%%
         %resize tab >>> 

         ResizeImgPath = "" ; 
         ResizeFIle = "" ; 
         Resize_tempImg = "" ; 



         %%% img enhancment tab 
         Enhancment_IMG_Path = "" ; 
         Enhancment_IMG_File = "" ; 
         Enhancment_Contrast  = 0 ; 
         Enhancment_tempIMG ;
         contrast = 0 ; 



       %%%img segmentation tab 
        Segmentation_IMG_Path = "" ; 
         Segmentation_IMG_File = "" ; 
         Segmentation_Contrast  = 0 ; 
         Segmentation_tempIMG ;
         

    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Load_For_colourSystem
        function Load_For_colourSystemButtonPushed(app, event)
            
            [file,path] = uigetfile('*.*') ; 
            app.ColourSystem_IMG_Path = path+""+file ; 
            app.ColourSystem_IMG_FILE = file ; 

            ShowIMg = imread(app.ColourSystem_IMG_Path) ; 
          imshow(ShowIMg, 'Parent',app.ColourSystem_IMG) ; 
                      imshow(ShowIMg, 'Parent',app.ColourSystem_UpdatedIMGSHOW) ; 

          %show hided component after loading the image : 
          app.BinaryButton.Visible="on" ; 
          app.GrayButton.Visible="on" ; 
          app.HSIButton.Visible="on" ; 
          app.ycbcrButton.Visible="on" ; 
         app.colourSystem_resetBtn.Visible="on" ;
        end

        % Button pushed function: Save_For_colourSystem
        function Save_For_colourSystemButtonPushed(app, event)
             x = string(app.ColourScheme_TextField.Value );

            newName = x+ "  "+"Edited "+""+string(app.ColourSystem_IMG_FILE) ;

                     app.FileSavedSuccesfulyLabel.Visible = "on" ;
                     
            imwrite(app.ColourSystem_tempImg,newName ) ;  
 
        end

        % Button pushed function: GrayButton
        function GrayButtonPushed(app, event)
               app.ColourSystem_tempImg = imread(app.ColourSystem_IMG_Path) ;
            app.ColourSystem_tempImg= rgb2gray(app.ColourSystem_tempImg) ; 
                      
          imshow(app.ColourSystem_tempImg , 'Parent',app.ColourSystem_UpdatedIMGSHOW) ; 

         app.Save_For_colourSystem.Visible="on" ; 
            app.ColourScheme_TextField.Visible="on" ; 


        end

        % Button pushed function: BinaryButton
        function BinaryButtonPushed(app, event)
               app.ColourSystem_tempImg = imread(app.ColourSystem_IMG_Path) ;
            app.ColourSystem_tempImg= im2bw(app.ColourSystem_tempImg) ; 
          
          imshow(app.ColourSystem_tempImg , 'Parent',app.ColourSystem_UpdatedIMGSHOW) ; 

           app.Save_For_colourSystem.Visible="on" ; 
            app.ColourScheme_TextField.Visible="on" ; 
        end

        % Button pushed function: HSIButton
        function HSIButtonPushed(app, event)
               app.ColourSystem_tempImg = imread(app.ColourSystem_IMG_Path) ;
            app.ColourSystem_tempImg= rgb2hsi(app.ColourSystem_tempImg) ; 
                      app.ColourSystem_tempImg= rgb2hsi(app.ColourSystem_tempImg) ; 

          imshow(app.ColourSystem_tempImg , 'Parent',app.ColourSystem_UpdatedIMGSHOW) ; 

           app.Save_For_colourSystem.Visible="on" ; 
            app.ColourScheme_TextField.Visible="on" ; 
        end

        % Button pushed function: ycbcrButton
        function ycbcrButtonPushed(app, event)
               app.ColourSystem_tempImg = imread(app.ColourSystem_IMG_Path) ;
            app.ColourSystem_tempImg= rgb2ycbcr(app.ColourSystem_tempImg) ; 
          
          imshow(app.ColourSystem_tempImg , 'Parent',app.ColourSystem_UpdatedIMGSHOW) ; 

           app.Save_For_colourSystem.Visible="on" ; 
            app.ColourScheme_TextField.Visible="on" ; 
        end

        % Button pushed function: Resize_Button_Load
        function Resize_Button_LoadButtonPushed(app, event)
            [file,path] = uigetfile('*.*') ; 
            app.ResizeImgPath = path+""+file ; 
            app.ResizeFIle= file ; 
            app.Resize_tempImg = imread(app.ResizeImgPath) ; 
          imshow(app.Resize_tempImg, 'Parent',app.Resize_Uploaded_Img_Window) ; 
            imshow(app.Resize_tempImg, 'Parent',app.Resize_Updated_Img_Window) ; 

        %% display image width and height ; 
        [height , width , tempVar] = size(app.Resize_tempImg); 
        width = str2double(string(width)) ; 
        height = str2double(string(height)) ; 
        app.WidthEditField.Value = width ; 
        app.HeightEditField.Value = height ; 
      
          %% make buttons visible after loading the image : 
          app.WidthEditField.Visible="on"
          app.HeightEditField.Visible ="on" ; 
              app.Resize_Btn_Apply.Visible ="on" ; 
     
        app.WidthEditFieldLabel.Visible="on" ;
        app.HeightEditFieldLabel.Visible ="on" ;
    app.Resize_Btn_reset.Visible="on" ; 
        end

        % Button pushed function: Resize_Button_Save
        function Resize_Button_SaveButtonPushed(app, event)
            %% if user forgest to click apply    
            Resize_Btn_ApplyButtonPushed(app,event) ;

             x = string(app.Resize_TextFeild.Value );
             
            newName = x+ "  "+"Edited "+"  "+string(app.ResizeFIle) ;

            imwrite(app.Resize_tempImg,newName ) 
            app.FileSavedSuccesfulyLabel_2.Visible="on";  
        end

        % Button pushed function: Resize_Btn_Apply
        function Resize_Btn_ApplyButtonPushed(app, event)
          
           
            width = str2double(string(app.WidthEditField.Value)); 
            height = str2double(string(app.HeightEditField.Value));
          
        
            app.Resize_tempImg = imresize(app.Resize_tempImg,[height,width]); 

                      imshow(app.Resize_tempImg, 'Parent',app.Resize_Updated_Img_Window) ; 

        %% make buttons visible to be able to save them 
                         app.Resize_Button_Save.Visible="on" ; 
        app.Resize_TextFeild.Visible="on"; 

        end

        % Button down function: ImageEnhancement_Img_window
        function ImageEnhancement_Img_windowButtonDown(app, event)
         
        end

        % Value changing function: Enhancment_Slider_constrast
        function Enhancment_Slider_constrastValueChanging(app, event)
            changingValue = event.Value;
            
            x = string(changingValue); 
            app.contrast =str2double(x) ; 
            
            
        end

        % Value changed function: Enhancment_Slider_constrast
        function Enhancment_Slider_constrastValueChanged(app, event)
            value = app.Enhancment_Slider_constrast.Value;
            
        end

        % Button pushed function: imgEnchancment_applyBTN
        function imgEnchancment_applyBTNButtonPushed(app, event)
        
          

            if (app.contrast < 0 )
                        app.Enhancment_tempIMG = imadjust(app.Enhancment_tempIMG, [0,(1-(-(app.contrast)))],[]) ; 

            elseif  (app.contrast > 0)
                            app.Enhancment_tempIMG= imadjust(app.Enhancment_tempIMG, [(app.contrast),1],[]) ; 

            
            end
       


            imshow(app.Enhancment_tempIMG, 'Parent',app.ImageEnhancement_Img_window_changed) ;
        end

        % Button pushed function: Enhancment_Auto_btn
        function Enhancment_Auto_btnButtonPushed(app, event)
           A = app.Enhancment_tempIMG ; 
            AInv = imcomplement(A);
BInv = imreducehaze(AInv);
B = imcomplement(BInv);
app.Enhancment_tempIMG= B ; 
            imshow(app.Enhancment_tempIMG, 'Parent',app.ImageEnhancement_Img_window_changed) ;

        end

        % Button pushed function: Enhancment_Reset_btn
        function Enhancment_Reset_btnButtonPushed(app, event)
            app.Enhancment_tempIMG= imread(app.Enhancment_IMG_Path); 
            
            imshow(app.Enhancment_tempIMG, 'Parent',app.ImageEnhancement_Img_window_changed) ;
        end

        % Button pushed function: Enhancment_Btn_Load
        function Enhancment_Btn_LoadButtonPushed(app, event)
            [file,path] = uigetfile('*.*') ; 
            app.Enhancment_IMG_Path = path+""+file ; 
            app.Enhancment_IMG_File= file ; 
            app.Enhancment_tempIMG = imread(app.Enhancment_IMG_Path) ;
           
          imshow(app.Enhancment_tempIMG, 'Parent',app.ImageEnhancement_Img_window_changed) ; 
                    imshow(app.Enhancment_tempIMG, 'Parent',app.ImageEnhancement_Img_window) ; 
                    app.Enhancment_Reset_btn.Visible="on"; 
                    app.imgEnchancment_applyBTN.Visible="on"; 
                    app.Enhancment_Auto_btn.Visible="on"; 
                    app.Enhancment_Slider_constrast.Visible="on"; 
                    app.Enhancment_Save.Visible="on"; 
                    app.Enhancment_FIleName_TextField.Visible="on"; 
                    app.ContrastSliderLabel.Visible="on"; 
                    app.Enhancment_blur_button.Visible="on";  
                    app.Enhancment_Noise_button.Visible="on" ; 
                    app.RemoveNoiseButton.Visible = "on" ; 
                    app.RemoveBlur.Visible = "on" ; 
        end

        % Button pushed function: Enhancment_Save
        function Enhancment_SaveButtonPushed(app, event)
          
             x = string(app.Enhancment_FIleName_TextField.Value );
             
            newName = x+ "  "+"Edited "+"  "+string(app.Enhancment_IMG_File) ;

            imwrite(app.Enhancment_tempIMG,newName ) 
            app.FileSavedSuccesfulyLabel_3.Visible="on";  
        end

        % Button pushed function: Segmentation_Btn_Load
        function Segmentation_Btn_LoadButtonPushed(app, event)
                [file,path] = uigetfile('*.*') ; 
            app.Segmentation_IMG_Path = path+""+file ; 
            app.Segmentation_IMG_File= file ; 
            app.Segmentation_tempIMG = imread(app.Segmentation_IMG_Path) ;
           
          imshow(app.Segmentation_tempIMG, 'Parent',app.Segmentation_Img_window_changed) ; 
                    imshow(app.Segmentation_tempIMG, 'Parent',app.Segmentation_Img_window) ; 
                   
                    app.Segmentation_Save.Visible="on"; 
                    app.Segmentation_FIleName_TextField.Visible="on"; 
                    app.Segmentation_Btn_DetectFace.Visible ="on" ; 
                    app.Segmentation_Btn_DetectSegment.Visible="on" ;
                    app.Segmentaion_Reset_btn.Visible="on" ; 
        end

        % Button pushed function: Segmentation_Btn_DetectFace
        function Segmentation_Btn_DetectFaceButtonPushed(app, event)
i=app.Segmentation_tempIMG; 
I=rgb2gray(i);
BW=im2bw(I);
[n1 n2]=size(BW);
r=floor(n1/10);
c=floor(n2/10);
x1=1;x2=r;
s=r*c;
for i=1:10
    y1=1;y2=c;
    for j=1:10
        if (y2<=c | y2>=9*c) | (x1==1 | x2==r*10)
            loc=find(BW(x1:x2, y1:y2)==0);
            [o p]=size(loc);
            pr=o*100/s;
            if pr<=100
                BW(x1:x2, y1:y2)=0;
                r1=x1;r2=x2;s1=y1;s2=y2;
                pr1=0;
            end
           %% imshow(BW);
        end
            y1=y1+c;
            y2=y2+c;
    end
    
 x1=x1+r;
 x2=x2+r;
end
 %%figure,imshow(BW)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% detection of face object
L = bwlabel(BW,8);
BB  = regionprops(L, 'BoundingBox');
BB1=struct2cell(BB);
BB2=cell2mat(BB1);
[s1 s2]=size(BB2);
mx=0;
for k=3:4:s2-1
    p=BB2(1,k)*BB2(1,k+1);
    if p>mx & (BB2(1,k)/BB2(1,k+1))<1.8
        mx=p;
        j=k;
    end
end

          imshow(I, 'Parent',app.Segmentation_Img_window_changed) ; 
          rectangle('Position',[BB2(1,j-2),BB2(1,j-1),BB2(1,j),BB2(1,j+1)],'EdgeColor','red' ) ;

 f = getframe(gca);
im = frame2im(f);
app.Segmentation_tempIMG = im ; 

        end

        % Button pushed function: Segmentation_Save
        function Segmentation_SaveButtonPushed(app, event)
               x = string(app.Segmentation_FIleName_TextField.Value );
             
            newName = x+ "  "+"Edited "+"  "+string(app.Segmentation_IMG_File) ;

            imwrite(app.Segmentation_tempIMG,newName ) 
            app.FileSavedSuccesfulyLabel_4.Visible="on";   
        end

        % Button down function: Resize_Updated_Img_Window
        function Resize_Updated_Img_WindowButtonDown(app, event)
            
        end

        % Button pushed function: Enhancment_blur_button
        function Enhancment_blur_buttonButtonPushed(app, event)
Image=im2double(app.Enhancment_tempIMG);

 len=20;
theta=10;
psf=fspecial('motion',len,theta);
blurred=imfilter(Image,psf,'conv','circular');

 app.Enhancment_tempIMG= blurred; 
           


            imshow(app.Enhancment_tempIMG, 'Parent',app.ImageEnhancement_Img_window_changed) ;

        end

        % Button pushed function: Enhancment_Noise_button
        function Enhancment_Noise_buttonButtonPushed(app, event)
       app.Enhancment_tempIMG = imnoise(app.Enhancment_tempIMG,'gaussian',0,0.01);


      

            imshow(app.Enhancment_tempIMG, 'Parent',app.ImageEnhancement_Img_window_changed) ;
        end

        % Callback function
        function Enhancment_removeNoise_buttonButtonPushed(app, event)
            img = app.Enhancment_tempIMG;
            K = wiener2(img,[5 5]);
            
        imshow(K) ;
        imshow(app.Enhancment_tempIMG, 'Parent',app.ImageEnhancement_Img_window_changed) ;

        end

        % Callback function
        function RemoveNoiseButtonPushed(app, event)
            J = app.Enhancment_tempIMG ; 
        end

        % Button pushed function: Segmentation_Btn_DetectSegment
        function Segmentation_Btn_DetectSegmentButtonPushed(app, event)
            app.Segmentation_tempIMG = imread(app.Segmentation_IMG_Path) ; 

A = app.Segmentation_tempIMG ; 
A = imresize(A,0.25);
Agray = rgb2gray(A);

imageSize = size(A);
numRows = imageSize(1);
numCols = imageSize(2);

wavelengthMin = 4/sqrt(2);
wavelengthMax = hypot(numRows,numCols);
n = floor(log2(wavelengthMax/wavelengthMin));
wavelength = 2.^(0:(n-2)) * wavelengthMin;

deltaTheta = 45;
orientation = 0:deltaTheta:(180-deltaTheta);

g = gabor(wavelength,orientation);
gabormag = imgaborfilt(Agray,g);

for i = 1:length(g)
    sigma = 0.5*g(i).Wavelength;
    K = 3;
    gabormag(:,:,i) = imgaussfilt(gabormag(:,:,i),K*sigma); 
end
X = 1:numCols;
Y = 1:numRows;
[X,Y] = meshgrid(X,Y);
featureSet = cat(3,gabormag,X);
featureSet = cat(3,featureSet,Y);

numPoints = numRows*numCols;
X = reshape(featureSet,numRows*numCols,[]);

X = bsxfun(@minus, X, mean(X));
X = bsxfun(@rdivide,X,std(X));
coeff = pca(X);
feature2DImage = reshape(X*coeff(:,1),numRows,numCols);

L = kmeans(X,2,'Replicates',5);

L = reshape(L,[numRows numCols]);

Aseg1 = zeros(size(A),'like',A);
Aseg2 = zeros(size(A),'like',A);
BW = L == 2;
BW = repmat(BW,[1 1 3]);
Aseg1(BW) = A(BW);
Aseg2(~BW) = A(~BW);
          imshow(Aseg2, 'Parent',app.Segmentation_Img_window_changed) ; 
app.Segmentation_tempIMG = Aseg2 ; 

        end

        % Button pushed function: Resize_Btn_reset
        function Resize_Btn_resetButtonPushed(app, event)
           app.Resize_tempImg = imread(app.ResizeImgPath) ; 
            

                    imshow(app.Resize_tempImg, 'Parent',app.Resize_Updated_Img_Window) ; 

        end

        % Button pushed function: Segmentaion_Reset_btn
        function Segmentaion_Reset_btnButtonPushed(app, event)
            app.Segmentation_tempIMG = imread(app.Segmentation_IMG_Path) ; 
            imshow(app.Segmentation_tempIMG , 'Parent',app.Segmentation_Img_window_changed) ; 
        end

        % Button pushed function: RemoveNoiseButton
        function RemoveNoiseButtonPushed2(app, event)
            
            app.Enhancment_tempIMG = medfilt3(app.Enhancment_tempIMG,[5,5,3]);

            imshow(app.Enhancment_tempIMG, 'Parent',app.ImageEnhancement_Img_window_changed) ; 

        end

        % Button pushed function: RemoveBlur
        function RemoveBlurPushed(app, event)

len=20;
theta=10;
psf=fspecial('motion',len,theta);
blurred=app.Enhancment_tempIMG;

Recovered=deconvwnr(app.Enhancment_tempIMG,psf,0);

app.Enhancment_tempIMG = Recovered ; 
          
            imshow(app.Enhancment_tempIMG, 'Parent',app.ImageEnhancement_Img_window_changed) ; 

        end

        % Button pushed function: colourSystem_resetBtn
        function colourSystem_resetBtnButtonPushed(app, event)
               
            app.ColourSystem_tempImg = imread(app.ColourSystem_IMG_Path) ; 

                      imshow(app.ColourSystem_tempImg, 'Parent',app.ColourSystem_UpdatedIMGSHOW) ; 

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [0 0 1920 1080];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.HandleVisibility = 'callback';
            app.UIFigure.WindowState = 'maximized';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [0 0 1920 1080];

            % Create ColourSystemsTab
            app.ColourSystemsTab = uitab(app.TabGroup);
            app.ColourSystemsTab.Title = 'Colour Systems';
            app.ColourSystemsTab.BackgroundColor = [0.3294 0.4706 0.502];
            app.ColourSystemsTab.Tag = 'ColourTab';

            % Create ColourSystem_UpdatedIMGSHOW
            app.ColourSystem_UpdatedIMGSHOW = uiaxes(app.ColourSystemsTab);
            app.ColourSystem_UpdatedIMGSHOW.Toolbar.Visible = 'off';
            app.ColourSystem_UpdatedIMGSHOW.AmbientLightColor = [1 0.4118 0.1608];
            app.ColourSystem_UpdatedIMGSHOW.XColor = [1 1 1];
            app.ColourSystem_UpdatedIMGSHOW.XTick = [];
            app.ColourSystem_UpdatedIMGSHOW.YColor = [1 1 1];
            app.ColourSystem_UpdatedIMGSHOW.YTick = [];
            app.ColourSystem_UpdatedIMGSHOW.ZColor = [1 1 1];
            app.ColourSystem_UpdatedIMGSHOW.ZTick = [];
            app.ColourSystem_UpdatedIMGSHOW.FontSize = 1;
            app.ColourSystem_UpdatedIMGSHOW.HandleVisibility = 'off';
            app.ColourSystem_UpdatedIMGSHOW.Interruptible = 'off';
            app.ColourSystem_UpdatedIMGSHOW.Position = [970 431 912 601];

            % Create ColourSystem_IMG
            app.ColourSystem_IMG = uiaxes(app.ColourSystemsTab);
            app.ColourSystem_IMG.Toolbar.Visible = 'off';
            app.ColourSystem_IMG.AmbientLightColor = [1 0.549 0.5804];
            app.ColourSystem_IMG.XColor = [1 1 1];
            app.ColourSystem_IMG.XTick = [];
            app.ColourSystem_IMG.YColor = [1 1 1];
            app.ColourSystem_IMG.YTick = [];
            app.ColourSystem_IMG.ZColor = [1 1 1];
            app.ColourSystem_IMG.ZTick = [];
            app.ColourSystem_IMG.FontSize = 1;
            app.ColourSystem_IMG.HandleVisibility = 'off';
            app.ColourSystem_IMG.Interruptible = 'off';
            app.ColourSystem_IMG.Position = [34 430 912 601];

            % Create Load_For_colourSystem
            app.Load_For_colourSystem = uibutton(app.ColourSystemsTab, 'push');
            app.Load_For_colourSystem.ButtonPushedFcn = createCallbackFcn(app, @Load_For_colourSystemButtonPushed, true);
            app.Load_For_colourSystem.BackgroundColor = [1 0.549 0.5804];
            app.Load_For_colourSystem.FontSize = 48;
            app.Load_For_colourSystem.FontColor = [1 1 1];
            app.Load_For_colourSystem.Position = [40 322 270 79];
            app.Load_For_colourSystem.Text = 'Load';

            % Create GrayButton
            app.GrayButton = uibutton(app.ColourSystemsTab, 'push');
            app.GrayButton.ButtonPushedFcn = createCallbackFcn(app, @GrayButtonPushed, true);
            app.GrayButton.BackgroundColor = [1 0.549 0.5804];
            app.GrayButton.FontSize = 48;
            app.GrayButton.FontColor = [1 1 1];
            app.GrayButton.Visible = 'off';
            app.GrayButton.Position = [1202 314 159 79];
            app.GrayButton.Text = 'Gray';

            % Create BinaryButton
            app.BinaryButton = uibutton(app.ColourSystemsTab, 'push');
            app.BinaryButton.ButtonPushedFcn = createCallbackFcn(app, @BinaryButtonPushed, true);
            app.BinaryButton.BackgroundColor = [1 0.549 0.5804];
            app.BinaryButton.FontSize = 48;
            app.BinaryButton.FontColor = [1 1 1];
            app.BinaryButton.Visible = 'off';
            app.BinaryButton.Position = [1422 314 159 79];
            app.BinaryButton.Text = 'Binary';

            % Create Save_For_colourSystem
            app.Save_For_colourSystem = uibutton(app.ColourSystemsTab, 'push');
            app.Save_For_colourSystem.ButtonPushedFcn = createCallbackFcn(app, @Save_For_colourSystemButtonPushed, true);
            app.Save_For_colourSystem.BackgroundColor = [1 0.549 0.5804];
            app.Save_For_colourSystem.FontSize = 48;
            app.Save_For_colourSystem.FontColor = [1 1 1];
            app.Save_For_colourSystem.Visible = 'off';
            app.Save_For_colourSystem.Position = [34 30 270 79];
            app.Save_For_colourSystem.Text = 'Save';

            % Create HSIButton
            app.HSIButton = uibutton(app.ColourSystemsTab, 'push');
            app.HSIButton.ButtonPushedFcn = createCallbackFcn(app, @HSIButtonPushed, true);
            app.HSIButton.BackgroundColor = [1 0.549 0.5804];
            app.HSIButton.FontSize = 48;
            app.HSIButton.FontColor = [1 1 1];
            app.HSIButton.Visible = 'off';
            app.HSIButton.Position = [1202 224 159 79];
            app.HSIButton.Text = 'HSI';

            % Create ycbcrButton
            app.ycbcrButton = uibutton(app.ColourSystemsTab, 'push');
            app.ycbcrButton.ButtonPushedFcn = createCallbackFcn(app, @ycbcrButtonPushed, true);
            app.ycbcrButton.BackgroundColor = [1 0.549 0.5804];
            app.ycbcrButton.FontSize = 48;
            app.ycbcrButton.FontColor = [1 1 1];
            app.ycbcrButton.Visible = 'off';
            app.ycbcrButton.Position = [1422 224 159 79];
            app.ycbcrButton.Text = 'ycbcr';

            % Create ColourScheme_TextField
            app.ColourScheme_TextField = uieditfield(app.ColourSystemsTab, 'text');
            app.ColourScheme_TextField.HorizontalAlignment = 'center';
            app.ColourScheme_TextField.FontSize = 48;
            app.ColourScheme_TextField.BackgroundColor = [1 0.549 0.5804];
            app.ColourScheme_TextField.Visible = 'off';
            app.ColourScheme_TextField.Placeholder = 'File Name';
            app.ColourScheme_TextField.Position = [34 124 270 79];

            % Create FileSavedSuccesfulyLabel
            app.FileSavedSuccesfulyLabel = uilabel(app.ColourSystemsTab);
            app.FileSavedSuccesfulyLabel.HandleVisibility = 'callback';
            app.FileSavedSuccesfulyLabel.HorizontalAlignment = 'center';
            app.FileSavedSuccesfulyLabel.FontSize = 48;
            app.FileSavedSuccesfulyLabel.FontColor = [1 1 1];
            app.FileSavedSuccesfulyLabel.Visible = 'off';
            app.FileSavedSuccesfulyLabel.Position = [590 53 739 92];
            app.FileSavedSuccesfulyLabel.Text = {'File Saved Succesfuly '; ''};

            % Create colourSystem_resetBtn
            app.colourSystem_resetBtn = uibutton(app.ColourSystemsTab, 'push');
            app.colourSystem_resetBtn.ButtonPushedFcn = createCallbackFcn(app, @colourSystem_resetBtnButtonPushed, true);
            app.colourSystem_resetBtn.HandleVisibility = 'callback';
            app.colourSystem_resetBtn.BackgroundColor = [1 0.549 0.5804];
            app.colourSystem_resetBtn.FontSize = 48;
            app.colourSystem_resetBtn.FontColor = [1 1 1];
            app.colourSystem_resetBtn.Visible = 'off';
            app.colourSystem_resetBtn.Position = [884 259 154 70];
            app.colourSystem_resetBtn.Text = 'Reset ';

            % Create Resize_Tab
            app.Resize_Tab = uitab(app.TabGroup);
            app.Resize_Tab.Title = 'Resize Image';
            app.Resize_Tab.BackgroundColor = [0.3294 0.4706 0.502];

            % Create Resize_Updated_Img_Window
            app.Resize_Updated_Img_Window = uiaxes(app.Resize_Tab);
            app.Resize_Updated_Img_Window.Toolbar.Visible = 'off';
            app.Resize_Updated_Img_Window.AmbientLightColor = [1 0.4118 0.1608];
            app.Resize_Updated_Img_Window.XColor = [1 1 1];
            app.Resize_Updated_Img_Window.XTick = [];
            app.Resize_Updated_Img_Window.YColor = [1 1 1];
            app.Resize_Updated_Img_Window.YTick = [];
            app.Resize_Updated_Img_Window.ZColor = [1 1 1];
            app.Resize_Updated_Img_Window.ZTick = [];
            app.Resize_Updated_Img_Window.FontSize = 1;
            app.Resize_Updated_Img_Window.HandleVisibility = 'off';
            app.Resize_Updated_Img_Window.ButtonDownFcn = createCallbackFcn(app, @Resize_Updated_Img_WindowButtonDown, true);
            app.Resize_Updated_Img_Window.Interruptible = 'off';
            app.Resize_Updated_Img_Window.Position = [970 431 912 601];

            % Create Resize_Uploaded_Img_Window
            app.Resize_Uploaded_Img_Window = uiaxes(app.Resize_Tab);
            app.Resize_Uploaded_Img_Window.Toolbar.Visible = 'off';
            app.Resize_Uploaded_Img_Window.AmbientLightColor = [1 0.549 0.5804];
            app.Resize_Uploaded_Img_Window.XColor = [1 1 1];
            app.Resize_Uploaded_Img_Window.XTick = [];
            app.Resize_Uploaded_Img_Window.YColor = [1 1 1];
            app.Resize_Uploaded_Img_Window.YTick = [];
            app.Resize_Uploaded_Img_Window.ZTick = [];
            app.Resize_Uploaded_Img_Window.FontSize = 1;
            app.Resize_Uploaded_Img_Window.HandleVisibility = 'off';
            app.Resize_Uploaded_Img_Window.Interruptible = 'off';
            app.Resize_Uploaded_Img_Window.Position = [34 430 912 601];

            % Create Resize_Button_Load
            app.Resize_Button_Load = uibutton(app.Resize_Tab, 'push');
            app.Resize_Button_Load.ButtonPushedFcn = createCallbackFcn(app, @Resize_Button_LoadButtonPushed, true);
            app.Resize_Button_Load.BackgroundColor = [1 0.549 0.5804];
            app.Resize_Button_Load.FontSize = 48;
            app.Resize_Button_Load.FontColor = [1 1 1];
            app.Resize_Button_Load.Position = [42 331 270 70];
            app.Resize_Button_Load.Text = 'Load';

            % Create WidthEditFieldLabel
            app.WidthEditFieldLabel = uilabel(app.Resize_Tab);
            app.WidthEditFieldLabel.HorizontalAlignment = 'right';
            app.WidthEditFieldLabel.FontSize = 48;
            app.WidthEditFieldLabel.FontColor = [1 1 1];
            app.WidthEditFieldLabel.Visible = 'off';
            app.WidthEditFieldLabel.Position = [991 282 127 70];
            app.WidthEditFieldLabel.Text = 'Width';

            % Create WidthEditField
            app.WidthEditField = uieditfield(app.Resize_Tab, 'numeric');
            app.WidthEditField.FontSize = 48;
            app.WidthEditField.Visible = 'off';
            app.WidthEditField.Position = [1133 282 258 70];

            % Create Resize_Btn_Apply
            app.Resize_Btn_Apply = uibutton(app.Resize_Tab, 'push');
            app.Resize_Btn_Apply.ButtonPushedFcn = createCallbackFcn(app, @Resize_Btn_ApplyButtonPushed, true);
            app.Resize_Btn_Apply.BackgroundColor = [1 0.549 0.5804];
            app.Resize_Btn_Apply.FontSize = 48;
            app.Resize_Btn_Apply.FontColor = [1 1 1];
            app.Resize_Btn_Apply.Visible = 'off';
            app.Resize_Btn_Apply.Position = [1485 262 271 70];
            app.Resize_Btn_Apply.Text = 'Apply';

            % Create HeightEditFieldLabel
            app.HeightEditFieldLabel = uilabel(app.Resize_Tab);
            app.HeightEditFieldLabel.HorizontalAlignment = 'right';
            app.HeightEditFieldLabel.FontSize = 48;
            app.HeightEditFieldLabel.FontColor = [1 1 1];
            app.HeightEditFieldLabel.Visible = 'off';
            app.HeightEditFieldLabel.Position = [982 190 143 70];
            app.HeightEditFieldLabel.Text = 'Height';

            % Create HeightEditField
            app.HeightEditField = uieditfield(app.Resize_Tab, 'numeric');
            app.HeightEditField.FontSize = 48;
            app.HeightEditField.Visible = 'off';
            app.HeightEditField.Position = [1140 190 258 70];

            % Create Resize_Button_Save
            app.Resize_Button_Save = uibutton(app.Resize_Tab, 'push');
            app.Resize_Button_Save.ButtonPushedFcn = createCallbackFcn(app, @Resize_Button_SaveButtonPushed, true);
            app.Resize_Button_Save.BackgroundColor = [1 0.549 0.5804];
            app.Resize_Button_Save.FontSize = 48;
            app.Resize_Button_Save.FontColor = [1 1 1];
            app.Resize_Button_Save.Visible = 'off';
            app.Resize_Button_Save.Position = [44 55 270 70];
            app.Resize_Button_Save.Text = 'Save';

            % Create Resize_TextFeild
            app.Resize_TextFeild = uieditfield(app.Resize_Tab, 'text');
            app.Resize_TextFeild.HorizontalAlignment = 'center';
            app.Resize_TextFeild.FontSize = 48;
            app.Resize_TextFeild.FontColor = [1 1 1];
            app.Resize_TextFeild.BackgroundColor = [1 0.549 0.5804];
            app.Resize_TextFeild.Visible = 'off';
            app.Resize_TextFeild.Placeholder = 'File Name';
            app.Resize_TextFeild.Position = [44 139 270 70];

            % Create FileSavedSuccesfulyLabel_2
            app.FileSavedSuccesfulyLabel_2 = uilabel(app.Resize_Tab);
            app.FileSavedSuccesfulyLabel_2.HandleVisibility = 'callback';
            app.FileSavedSuccesfulyLabel_2.HorizontalAlignment = 'center';
            app.FileSavedSuccesfulyLabel_2.FontSize = 48;
            app.FileSavedSuccesfulyLabel_2.FontColor = [1 1 1];
            app.FileSavedSuccesfulyLabel_2.Visible = 'off';
            app.FileSavedSuccesfulyLabel_2.Position = [591 52 739 92];
            app.FileSavedSuccesfulyLabel_2.Text = {'File Saved Succesfuly '; ''};

            % Create Resize_Btn_reset
            app.Resize_Btn_reset = uibutton(app.Resize_Tab, 'push');
            app.Resize_Btn_reset.ButtonPushedFcn = createCallbackFcn(app, @Resize_Btn_resetButtonPushed, true);
            app.Resize_Btn_reset.HandleVisibility = 'callback';
            app.Resize_Btn_reset.BackgroundColor = [1 0.549 0.5804];
            app.Resize_Btn_reset.FontSize = 48;
            app.Resize_Btn_reset.FontColor = [1 1 1];
            app.Resize_Btn_reset.Visible = 'off';
            app.Resize_Btn_reset.Position = [1560 174 154 70];
            app.Resize_Btn_reset.Text = 'Reset ';

            % Create EnhancmentTab
            app.EnhancmentTab = uitab(app.TabGroup);
            app.EnhancmentTab.Title = 'Enhancment';
            app.EnhancmentTab.BackgroundColor = [0.3294 0.4706 0.502];

            % Create ImageEnhancement_Img_window
            app.ImageEnhancement_Img_window = uiaxes(app.EnhancmentTab);
            app.ImageEnhancement_Img_window.Toolbar.Visible = 'off';
            app.ImageEnhancement_Img_window.AmbientLightColor = [1 0.549 0.5804];
            app.ImageEnhancement_Img_window.XColor = [1 1 1];
            app.ImageEnhancement_Img_window.XTick = [];
            app.ImageEnhancement_Img_window.YColor = [1 1 1];
            app.ImageEnhancement_Img_window.YTick = [];
            app.ImageEnhancement_Img_window.ZColor = [1 1 1];
            app.ImageEnhancement_Img_window.ZTick = [];
            app.ImageEnhancement_Img_window.FontSize = 1;
            app.ImageEnhancement_Img_window.HandleVisibility = 'off';
            app.ImageEnhancement_Img_window.ButtonDownFcn = createCallbackFcn(app, @ImageEnhancement_Img_windowButtonDown, true);
            app.ImageEnhancement_Img_window.Interruptible = 'off';
            app.ImageEnhancement_Img_window.Position = [34 430 912 601];

            % Create ImageEnhancement_Img_window_changed
            app.ImageEnhancement_Img_window_changed = uiaxes(app.EnhancmentTab);
            app.ImageEnhancement_Img_window_changed.Toolbar.Visible = 'off';
            app.ImageEnhancement_Img_window_changed.AmbientLightColor = [1 0.549 0.5804];
            app.ImageEnhancement_Img_window_changed.XColor = [1 1 1];
            app.ImageEnhancement_Img_window_changed.XTick = [];
            app.ImageEnhancement_Img_window_changed.YColor = [1 1 1];
            app.ImageEnhancement_Img_window_changed.YTick = [];
            app.ImageEnhancement_Img_window_changed.ZColor = [1 1 1];
            app.ImageEnhancement_Img_window_changed.ZTick = [];
            app.ImageEnhancement_Img_window_changed.FontSize = 1;
            app.ImageEnhancement_Img_window_changed.HandleVisibility = 'callback';
            app.ImageEnhancement_Img_window_changed.Interruptible = 'off';
            app.ImageEnhancement_Img_window_changed.Position = [970 431 912 601];

            % Create Label
            app.Label = uilabel(app.EnhancmentTab);
            app.Label.HorizontalAlignment = 'right';
            app.Label.FontSize = 48;
            app.Label.FontWeight = 'bold';
            app.Label.FontColor = [0.3294 0.4706 0.502];
            app.Label.Position = [1449 322 25 62];
            app.Label.Text = '';

            % Create Enhancment_Auto_btn
            app.Enhancment_Auto_btn = uibutton(app.EnhancmentTab, 'push');
            app.Enhancment_Auto_btn.ButtonPushedFcn = createCallbackFcn(app, @Enhancment_Auto_btnButtonPushed, true);
            app.Enhancment_Auto_btn.HandleVisibility = 'callback';
            app.Enhancment_Auto_btn.BackgroundColor = [1 0.549 0.5804];
            app.Enhancment_Auto_btn.FontSize = 48;
            app.Enhancment_Auto_btn.FontColor = [1 1 1];
            app.Enhancment_Auto_btn.Visible = 'off';
            app.Enhancment_Auto_btn.Position = [411 96 604 70];
            app.Enhancment_Auto_btn.Text = 'Auto-Light  Enhancement';

            % Create Enhancment_Slider_constrast
            app.Enhancment_Slider_constrast = uislider(app.EnhancmentTab);
            app.Enhancment_Slider_constrast.Limits = [-0.999 0.999];
            app.Enhancment_Slider_constrast.ValueChangedFcn = createCallbackFcn(app, @Enhancment_Slider_constrastValueChanged, true);
            app.Enhancment_Slider_constrast.ValueChangingFcn = createCallbackFcn(app, @Enhancment_Slider_constrastValueChanging, true);
            app.Enhancment_Slider_constrast.HandleVisibility = 'callback';
            app.Enhancment_Slider_constrast.Visible = 'off';
            app.Enhancment_Slider_constrast.FontSize = 48;
            app.Enhancment_Slider_constrast.FontWeight = 'bold';
            app.Enhancment_Slider_constrast.FontColor = [0.3294 0.4706 0.502];
            app.Enhancment_Slider_constrast.Position = [1081 302 779 3];
            app.Enhancment_Slider_constrast.Value = 0.1;

            % Create imgEnchancment_applyBTN
            app.imgEnchancment_applyBTN = uibutton(app.EnhancmentTab, 'push');
            app.imgEnchancment_applyBTN.ButtonPushedFcn = createCallbackFcn(app, @imgEnchancment_applyBTNButtonPushed, true);
            app.imgEnchancment_applyBTN.HandleVisibility = 'callback';
            app.imgEnchancment_applyBTN.BackgroundColor = [1 0.549 0.5804];
            app.imgEnchancment_applyBTN.FontSize = 48;
            app.imgEnchancment_applyBTN.FontColor = [1 1 1];
            app.imgEnchancment_applyBTN.Visible = 'off';
            app.imgEnchancment_applyBTN.Position = [1303 138 335 70];
            app.imgEnchancment_applyBTN.Text = 'Apply Contrast';

            % Create Enhancment_Reset_btn
            app.Enhancment_Reset_btn = uibutton(app.EnhancmentTab, 'push');
            app.Enhancment_Reset_btn.ButtonPushedFcn = createCallbackFcn(app, @Enhancment_Reset_btnButtonPushed, true);
            app.Enhancment_Reset_btn.HandleVisibility = 'callback';
            app.Enhancment_Reset_btn.BackgroundColor = [1 0.549 0.5804];
            app.Enhancment_Reset_btn.FontSize = 48;
            app.Enhancment_Reset_btn.FontColor = [1 1 1];
            app.Enhancment_Reset_btn.Visible = 'off';
            app.Enhancment_Reset_btn.Position = [649 13 154 70];
            app.Enhancment_Reset_btn.Text = 'Reset ';

            % Create Enhancment_Btn_Load
            app.Enhancment_Btn_Load = uibutton(app.EnhancmentTab, 'push');
            app.Enhancment_Btn_Load.ButtonPushedFcn = createCallbackFcn(app, @Enhancment_Btn_LoadButtonPushed, true);
            app.Enhancment_Btn_Load.BackgroundColor = [1 0.549 0.5804];
            app.Enhancment_Btn_Load.FontSize = 48;
            app.Enhancment_Btn_Load.FontColor = [1 1 1];
            app.Enhancment_Btn_Load.Position = [42 330 270 70];
            app.Enhancment_Btn_Load.Text = 'Load';

            % Create Enhancment_Save
            app.Enhancment_Save = uibutton(app.EnhancmentTab, 'push');
            app.Enhancment_Save.ButtonPushedFcn = createCallbackFcn(app, @Enhancment_SaveButtonPushed, true);
            app.Enhancment_Save.BackgroundColor = [1 0.549 0.5804];
            app.Enhancment_Save.FontSize = 48;
            app.Enhancment_Save.FontColor = [1 1 1];
            app.Enhancment_Save.Visible = 'off';
            app.Enhancment_Save.Position = [42 35 269 70];
            app.Enhancment_Save.Text = 'Save';

            % Create Enhancment_FIleName_TextField
            app.Enhancment_FIleName_TextField = uieditfield(app.EnhancmentTab, 'text');
            app.Enhancment_FIleName_TextField.HorizontalAlignment = 'center';
            app.Enhancment_FIleName_TextField.FontSize = 48;
            app.Enhancment_FIleName_TextField.FontColor = [1 1 1];
            app.Enhancment_FIleName_TextField.BackgroundColor = [1 0.549 0.5804];
            app.Enhancment_FIleName_TextField.Visible = 'off';
            app.Enhancment_FIleName_TextField.Placeholder = 'File Name';
            app.Enhancment_FIleName_TextField.Position = [42 113 268 64];

            % Create FileSavedSuccesfulyLabel_3
            app.FileSavedSuccesfulyLabel_3 = uilabel(app.EnhancmentTab);
            app.FileSavedSuccesfulyLabel_3.HandleVisibility = 'callback';
            app.FileSavedSuccesfulyLabel_3.HorizontalAlignment = 'center';
            app.FileSavedSuccesfulyLabel_3.FontSize = 48;
            app.FileSavedSuccesfulyLabel_3.FontColor = [1 1 1];
            app.FileSavedSuccesfulyLabel_3.Visible = 'off';
            app.FileSavedSuccesfulyLabel_3.Position = [1093 17 739 92];
            app.FileSavedSuccesfulyLabel_3.Text = {'File Saved Succesfuly '; ''};

            % Create Enhancment_blur_button
            app.Enhancment_blur_button = uibutton(app.EnhancmentTab, 'push');
            app.Enhancment_blur_button.ButtonPushedFcn = createCallbackFcn(app, @Enhancment_blur_buttonButtonPushed, true);
            app.Enhancment_blur_button.BackgroundColor = [1 0.549 0.5804];
            app.Enhancment_blur_button.FontSize = 48;
            app.Enhancment_blur_button.FontColor = [1 1 1];
            app.Enhancment_blur_button.Visible = 'off';
            app.Enhancment_blur_button.Position = [411 190 239 70];
            app.Enhancment_blur_button.Text = 'Add Blur';

            % Create Enhancment_Noise_button
            app.Enhancment_Noise_button = uibutton(app.EnhancmentTab, 'push');
            app.Enhancment_Noise_button.ButtonPushedFcn = createCallbackFcn(app, @Enhancment_Noise_buttonButtonPushed, true);
            app.Enhancment_Noise_button.BackgroundColor = [1 0.549 0.5804];
            app.Enhancment_Noise_button.FontSize = 48;
            app.Enhancment_Noise_button.FontColor = [1 1 1];
            app.Enhancment_Noise_button.Visible = 'off';
            app.Enhancment_Noise_button.Position = [411 292 239 70];
            app.Enhancment_Noise_button.Text = 'Add Noise';

            % Create ContrastSliderLabel
            app.ContrastSliderLabel = uilabel(app.EnhancmentTab);
            app.ContrastSliderLabel.FontSize = 48;
            app.ContrastSliderLabel.FontColor = [1 1 1];
            app.ContrastSliderLabel.Visible = 'off';
            app.ContrastSliderLabel.Position = [1299 350 328 62];
            app.ContrastSliderLabel.Text = 'Contrast Slider';

            % Create RemoveNoiseButton
            app.RemoveNoiseButton = uibutton(app.EnhancmentTab, 'push');
            app.RemoveNoiseButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveNoiseButtonPushed2, true);
            app.RemoveNoiseButton.BackgroundColor = [1 0.549 0.5804];
            app.RemoveNoiseButton.FontSize = 48;
            app.RemoveNoiseButton.FontColor = [1 1 1];
            app.RemoveNoiseButton.Visible = 'off';
            app.RemoveNoiseButton.Position = [679 292 335 70];
            app.RemoveNoiseButton.Text = 'Remove Noise';

            % Create RemoveBlur
            app.RemoveBlur = uibutton(app.EnhancmentTab, 'push');
            app.RemoveBlur.ButtonPushedFcn = createCallbackFcn(app, @RemoveBlurPushed, true);
            app.RemoveBlur.BackgroundColor = [1 0.549 0.5804];
            app.RemoveBlur.FontSize = 48;
            app.RemoveBlur.FontColor = [1 1 1];
            app.RemoveBlur.Visible = 'off';
            app.RemoveBlur.Position = [692 195 323 70];
            app.RemoveBlur.Text = 'Deblur';

            % Create SegmentationTab
            app.SegmentationTab = uitab(app.TabGroup);
            app.SegmentationTab.Title = 'Segmentation';
            app.SegmentationTab.BackgroundColor = [0.3294 0.4706 0.502];

            % Create Segmentation_Img_window
            app.Segmentation_Img_window = uiaxes(app.SegmentationTab);
            app.Segmentation_Img_window.Toolbar.Visible = 'off';
            app.Segmentation_Img_window.AmbientLightColor = [1 0.549 0.5804];
            app.Segmentation_Img_window.XColor = [1 1 1];
            app.Segmentation_Img_window.XTick = [];
            app.Segmentation_Img_window.YColor = [1 1 1];
            app.Segmentation_Img_window.YTick = [];
            app.Segmentation_Img_window.ZColor = [1 1 1];
            app.Segmentation_Img_window.ZTick = [];
            app.Segmentation_Img_window.FontSize = 1;
            app.Segmentation_Img_window.HandleVisibility = 'off';
            app.Segmentation_Img_window.Interruptible = 'off';
            app.Segmentation_Img_window.Position = [34 430 912 601];

            % Create Segmentation_Img_window_changed
            app.Segmentation_Img_window_changed = uiaxes(app.SegmentationTab);
            app.Segmentation_Img_window_changed.Toolbar.Visible = 'off';
            app.Segmentation_Img_window_changed.AmbientLightColor = [1 0.549 0.5804];
            app.Segmentation_Img_window_changed.XColor = [1 1 1];
            app.Segmentation_Img_window_changed.XTick = [];
            app.Segmentation_Img_window_changed.YColor = [1 1 1];
            app.Segmentation_Img_window_changed.YTick = [];
            app.Segmentation_Img_window_changed.ZColor = [1 1 1];
            app.Segmentation_Img_window_changed.ZTick = [];
            app.Segmentation_Img_window_changed.FontSize = 1;
            app.Segmentation_Img_window_changed.HandleVisibility = 'callback';
            app.Segmentation_Img_window_changed.Interruptible = 'off';
            app.Segmentation_Img_window_changed.Position = [970 431 912 601];

            % Create Segmentation_Btn_Load
            app.Segmentation_Btn_Load = uibutton(app.SegmentationTab, 'push');
            app.Segmentation_Btn_Load.ButtonPushedFcn = createCallbackFcn(app, @Segmentation_Btn_LoadButtonPushed, true);
            app.Segmentation_Btn_Load.BackgroundColor = [1 0.549 0.5804];
            app.Segmentation_Btn_Load.FontSize = 48;
            app.Segmentation_Btn_Load.FontColor = [1 1 1];
            app.Segmentation_Btn_Load.Position = [40 322 250 79];
            app.Segmentation_Btn_Load.Text = 'Load';

            % Create Segmentation_Save
            app.Segmentation_Save = uibutton(app.SegmentationTab, 'push');
            app.Segmentation_Save.ButtonPushedFcn = createCallbackFcn(app, @Segmentation_SaveButtonPushed, true);
            app.Segmentation_Save.BackgroundColor = [1 0.549 0.5804];
            app.Segmentation_Save.FontSize = 48;
            app.Segmentation_Save.FontColor = [1 1 1];
            app.Segmentation_Save.Visible = 'off';
            app.Segmentation_Save.Position = [42 24 244 79];
            app.Segmentation_Save.Text = 'Save';

            % Create Segmentation_FIleName_TextField
            app.Segmentation_FIleName_TextField = uieditfield(app.SegmentationTab, 'text');
            app.Segmentation_FIleName_TextField.HorizontalAlignment = 'center';
            app.Segmentation_FIleName_TextField.FontSize = 48;
            app.Segmentation_FIleName_TextField.FontColor = [1 1 1];
            app.Segmentation_FIleName_TextField.BackgroundColor = [1 0.549 0.5804];
            app.Segmentation_FIleName_TextField.Visible = 'off';
            app.Segmentation_FIleName_TextField.Placeholder = 'File Name';
            app.Segmentation_FIleName_TextField.Position = [46 114 244 79];

            % Create Segmentation_Btn_DetectFace
            app.Segmentation_Btn_DetectFace = uibutton(app.SegmentationTab, 'push');
            app.Segmentation_Btn_DetectFace.ButtonPushedFcn = createCallbackFcn(app, @Segmentation_Btn_DetectFaceButtonPushed, true);
            app.Segmentation_Btn_DetectFace.BackgroundColor = [1 0.549 0.5804];
            app.Segmentation_Btn_DetectFace.FontSize = 48;
            app.Segmentation_Btn_DetectFace.FontColor = [1 1 1];
            app.Segmentation_Btn_DetectFace.Visible = 'off';
            app.Segmentation_Btn_DetectFace.Position = [1239 305 342 79];
            app.Segmentation_Btn_DetectFace.Text = 'Detect Face';

            % Create FileSavedSuccesfulyLabel_4
            app.FileSavedSuccesfulyLabel_4 = uilabel(app.SegmentationTab);
            app.FileSavedSuccesfulyLabel_4.HandleVisibility = 'callback';
            app.FileSavedSuccesfulyLabel_4.HorizontalAlignment = 'center';
            app.FileSavedSuccesfulyLabel_4.FontSize = 48;
            app.FileSavedSuccesfulyLabel_4.FontColor = [1 1 1];
            app.FileSavedSuccesfulyLabel_4.Visible = 'off';
            app.FileSavedSuccesfulyLabel_4.Position = [563 18 739 92];
            app.FileSavedSuccesfulyLabel_4.Text = {'File Saved Succesfuly '; ''};

            % Create Segmentation_Btn_DetectSegment
            app.Segmentation_Btn_DetectSegment = uibutton(app.SegmentationTab, 'push');
            app.Segmentation_Btn_DetectSegment.ButtonPushedFcn = createCallbackFcn(app, @Segmentation_Btn_DetectSegmentButtonPushed, true);
            app.Segmentation_Btn_DetectSegment.BackgroundColor = [1 0.549 0.5804];
            app.Segmentation_Btn_DetectSegment.FontSize = 48;
            app.Segmentation_Btn_DetectSegment.FontColor = [1 1 1];
            app.Segmentation_Btn_DetectSegment.Visible = 'off';
            app.Segmentation_Btn_DetectSegment.Position = [1228 206 365 79];
            app.Segmentation_Btn_DetectSegment.Text = 'Detect Segment';

            % Create Segmentaion_Reset_btn
            app.Segmentaion_Reset_btn = uibutton(app.SegmentationTab, 'push');
            app.Segmentaion_Reset_btn.ButtonPushedFcn = createCallbackFcn(app, @Segmentaion_Reset_btnButtonPushed, true);
            app.Segmentaion_Reset_btn.HandleVisibility = 'callback';
            app.Segmentaion_Reset_btn.BackgroundColor = [1 0.549 0.5804];
            app.Segmentaion_Reset_btn.FontSize = 48;
            app.Segmentaion_Reset_btn.FontColor = [1 1 1];
            app.Segmentaion_Reset_btn.Visible = 'off';
            app.Segmentaion_Reset_btn.Position = [1334 105 154 70];
            app.Segmentaion_Reset_btn.Text = 'Reset ';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = ImageProcessing_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end