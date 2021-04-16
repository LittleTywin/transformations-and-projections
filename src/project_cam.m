function [P, D] = project_cam(w, cv, cx, cy, cz, p)
    %p: 3x1 point (3xN)
    %cv: 3x1 cam center
    %cx, cy, cz: 3x1 cam axis
    %w: apostasi petasmatos
    P = zeros(2,size(p,2));
    D = zeros(size(p,2));
    
    cam = transformation_matrix;
    cam.T(1:3,1:4)=[cx cy cz cv];
    invcam
    i=1:size(p,2);
    pn=affine_transform(p,inv(cam));
    P = pn(1:2,i)*w/pn(3,i);
    D = pn(3,i);
end

