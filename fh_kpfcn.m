function fh_kpfcn(H,E)
global Pressure
try
    switch E.Key
        case 'rightarrow'
           
       case 'leftarrow'
           
       case 'uparrow'
           Pressure = ceil(Pressure*1.02);
       case 'downarrow'
           Pressure = floor(Pressure*0.98);
    end
    drawnow;
catch
end