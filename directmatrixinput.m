data=[1 90; 1 0 ;1 180]
set_param(['NOP' '/Slider Gain'],'Gain','90')
    pause(1);
    [m,~] = size(data);
    disp(data)
    for i=1:m
        
        if data(i,1) == 1
           d1=data(i,2);
           disp(d1)
            set_param(['NOP' '/Slider Gain'],'Gain',num2str(d1))
            
            pause(2)
            end
        
    end