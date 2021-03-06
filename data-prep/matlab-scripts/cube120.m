%masking noise injection for skull models with voxel resolution of 120x120x120
data_path='F:\MAT\data-workflow\skull-mat\120';

phases = {'test'}; %noise injection is only applied on the testing set

for t = 1 : numel(phases)

	phase=phases{t};

	mat_list =[data_path '\' phase];

	mat_files=dir(fullfile(mat_list, '*.mat'));

	for i = 1: length(mat_files)
		%assuring only .mat files are processed
        if strcmp(mat_files(i).name, '.') || strcmp(mat_files(i).name, '..') || mat_files(i).isdir == 1 || ~strcmp(mat_files(i).name(end-2:end), 'mat')
            continue;
        end

        filename = [mat_list '\' mat_files(i).name];

		load(filename, 'instance');
		defected=instance(:,:,:);
        
        enough=0;
        while enough == 0
        	%choosing the coordinates in the model where to remove the voxel cube [bb,cc,dd]
			bb = randperm(120,1);
			cc = randperm(120,1) ;
			%dd = randperm(30,1) ;
			dd = randi([46 120],1,1);

			%selecting the dimensions of the cube. possible dimensions: 20x20x20, 24x24x24, 28x28x28 and 32x32x32
			even_quatro=1;
			while even_quatro~=0
				cube_dim= randi([20 32],1,1);
				even_quatro=rem(cube_dim,4);
				%disp(cube_dim);
			end
            
            fprintf('1. cube_dim %d \n', cube_dim);
			%placing the cube in the selected model location
			if cube_dim==32 %cube dimensions:32x32x32
			    if bb+32>120
				 b = [bb,bb-1, bb-2, bb-3, bb-4, bb-5, bb-6, bb-7, bb-8, bb-9, bb-10, bb-11, bb-12, bb-13, bb-14, bb-15, bb-16, bb-17, bb-18, bb-19, bb-20, bb-21, bb-22, bb-23, bb-24, bb-25, bb-26, bb-27, bb-28, bb-29, bb-30, bb-31, bb-32];
			    else
			     b = [bb,bb+1, bb+2, bb+3, bb+4, bb+5, bb+6, bb+7, bb+8, bb+9, bb+10, bb+11, bb+12, bb+13, bb+14, bb+15, bb+16, bb+17, bb+18, bb+19, bb+20, bb+21, bb+22, bb+23, bb+24, bb+25, bb+26, bb+27, bb+28, bb+29, bb+30, bb+31, bb+32];
			    end

			    if cc+32>120
				 c = [cc,cc-1, cc-2, cc-3, cc-4, cc-5, cc-6, cc-7, cc-8, cc-9, cc-10, cc-11, cc-12, cc-13, cc-14, cc-15, cc-16, cc-17, cc-18, cc-19, cc-20, cc-21, cc-22, cc-23, cc-24, cc-25, cc-26, cc-27, cc-28, cc-29, cc-30, cc-31, cc-32];
				else
				 c = [cc,cc+1, cc+2, cc+3, cc+4, cc+5, cc+6, cc+7, cc+8, cc+9, cc+10, cc+11, cc+12, cc+13, cc+14, cc+15, cc+16, cc+17, cc+18, cc+19, cc+20, cc+21, cc+22, cc+23, cc+24, cc+25, cc+26, cc+27, cc+28, cc+29, cc+30, cc+31, cc+32];

			    end

			    if dd+32>120
				 d = [dd,dd-1, dd-2, dd-3, dd-4, dd-5, dd-6, dd-7, dd-8, dd-9, dd-10, dd-11, dd-12, dd-13, dd-14, dd-15, dd-16, dd-17, dd-18, dd-19, dd-20, dd-21, dd-22, dd-23, dd-24, dd-25, dd-26, dd-27, dd-28, dd-29, dd-30, dd-31, dd-32];
				else
				 d = [dd,dd+1, dd+2, dd+3, dd+4, dd+5, dd+6, dd+7, dd+8, dd+9, dd+10, dd+11, dd+12, dd+13, dd+14, dd+15, dd+16, dd+17, dd+18, dd+19, dd+20, dd+21, dd+22, dd+23, dd+24, dd+25, dd+26, dd+27, dd+28, dd+29, dd+30, dd+31, dd+32];

			    end
			end
			

			if cube_dim==28 %cube dimensions:28x28x28
			    if bb+28>120 
			     b = [bb,bb-1, bb-2, bb-3, bb-4, bb-5, bb-6, bb-7, bb-8, bb-9, bb-10, bb-11, bb-12, bb-13, bb-14, bb-15, bb-16, bb-17, bb-18, bb-19, bb-20, bb-21, bb-22, bb-23, bb-24, bb-25, bb-26, bb-27, bb-28];
			    else
			     b = [bb,bb+1, bb+2, bb+3, bb+4, bb+5, bb+6, bb+7, bb+8, bb+9, bb+10, bb+11, bb+12, bb+13, bb+14, bb+15, bb+16, bb+17, bb+18, bb+19, bb+20, bb+21, bb+22, bb+23, bb+24, bb+25, bb+26, bb+27, bb+28];
			    end

			    if cc+28>120
				 c = [cc,cc-1, cc-2, cc-3, cc-4, cc-5, cc-6, cc-7, cc-8, cc-9, cc-10, cc-11, cc-12, cc-13, cc-14, cc-15, cc-16, cc-17, cc-18, cc-19, cc-20, cc-21, cc-22, cc-23, cc-24, cc-25, cc-26, cc-27, cc-28];
				else
				 c = [cc,cc+1, cc+2, cc+3, cc+4, cc+5, cc+6, cc+7, cc+8, cc+9, cc+10, cc+11, cc+12, cc+13, cc+14, cc+15, cc+16, cc+17, cc+18, cc+19, cc+20, cc+21, cc+22, cc+23, cc+24, cc+25, cc+26, cc+27, cc+28];
			    end

			    if dd+28>120
				 d = [dd,dd-1, dd-2, dd-3, dd-4, dd-5, dd-6, dd-7, dd-8, dd-9, dd-10, dd-11, dd-12, dd-13, dd-14, dd-15, dd-16, dd-17, dd-18, dd-19, dd-20, dd-21, dd-22, dd-23, dd-24, dd-25, dd-26, dd-27, dd-28];
				else
				 d = [dd,dd+1, dd+2, dd+3, dd+4, dd+5, dd+6, dd+7, dd+8, dd+9, dd+10, dd+11, dd+12, dd+13, dd+14, dd+15, dd+16, dd+17, dd+18, dd+19, dd+20, dd+21, dd+22, dd+23, dd+24, dd+25, dd+26, dd+27, dd+28];
			    end
			end

			
			if cube_dim==24 %cube dimensions: 24x24x24
			    if bb+24>120
			     b = [bb,bb-1, bb-2, bb-3, bb-4, bb-5, bb-6, bb-7, bb-8, bb-9, bb-10, bb-11, bb-12, bb-13, bb-14, bb-15, bb-16, bb-17, bb-18, bb-19, bb-20, bb-21, bb-22, bb-23, bb-24];
			    else
			     b = [bb,bb+1, bb+2, bb+3, bb+4, bb+5, bb+6, bb+7, bb+8, bb+9, bb+10, bb+11, bb+12, bb+13, bb+14, bb+15, bb+16, bb+17, bb+18, bb+19, bb+20, bb+21, bb+22, bb+23, bb+24];
			    end

			    if cc+24>120
			   	 c = [cc,cc-1, cc-2, cc-3, cc-4, cc-5, cc-6, cc-7, cc-8, cc-9, cc-10, cc-11, cc-12, cc-13, cc-14, cc-15, cc-16, cc-17, cc-18, cc-19, cc-20, cc-21, cc-22, cc-23, cc-24];
			  	else
			  	 c = [cc,cc+1, cc+2, cc+3, cc+4, cc+5, cc+6, cc+7, cc+8, cc+9, cc+10, cc+11, cc+12, cc+13, cc+14, cc+15, cc+16, cc+17, cc+18, cc+19, cc+20, cc+21, cc+22, cc+23, cc+24];
			    end

			    if dd+24>120
			     d = [dd,dd-1, dd-2, dd-3, dd-4, dd-5, dd-6, dd-7, dd-8, dd-9, dd-10, dd-11, dd-12, dd-13, dd-14, dd-15, dd-16, dd-17, dd-18, dd-19, dd-20, dd-21, dd-22, dd-23, dd-24];
			  	else
				 d = [dd,dd+1, dd+2, dd+3, dd+4, dd+5, dd+6, dd+7, dd+8, dd+9, dd+10, dd+11, dd+12, dd+13, dd+14, dd+15, dd+16, dd+17, dd+18, dd+19, dd+20, dd+21, dd+22, dd+23, dd+24];
			    end
			end


			if cube_dim==20 %cube dimensions:20x20x20
			    if bb+20>120
			     b = [bb,bb-1, bb-2, bb-3, bb-4, bb-5, bb-6, bb-7, bb-8, bb-9, bb-10, bb-11, bb-12, bb-13, bb-14, bb-15, bb-16, bb-17, bb-18, bb-19, bb-20];
			    else
			     b = [bb,bb+1, bb+2, bb+3, bb+4, bb+5, bb+6, bb+7, bb+8, bb+9, bb+10, bb+11, bb+12, bb+13, bb+14, bb+15, bb+16, bb+17, bb+18, bb+19, bb+20];
			    end

			    if cc+20>120
			     c = [cc,cc-1, cc-2, cc-3, cc-4, cc-5, cc-6, cc-7, cc-8, cc-9, cc-10, cc-11, cc-12, cc-13, cc-14, cc-15, cc-16, cc-17, cc-18, cc-19, cc-20];
			    else
			     c = [cc,cc+1, cc+2, cc+3, cc+4, cc+5, cc+6, cc+7, cc+8, cc+9, cc+10, cc+11, cc+12, cc+13, cc+14, cc+15, cc+16, cc+17, cc+18, cc+19, cc+20];
			    end

			    if dd+20>120
			     d = [dd,dd-1, dd-2, dd-3, dd-4, dd-5, dd-6, dd-7, dd-8, dd-9, dd-10, dd-11, dd-12, dd-13, dd-14, dd-15, dd-16, dd-17, dd-18, dd-19, dd-20];
			    else
			     d = [dd,dd+1, dd+2, dd+3, dd+4, dd+5, dd+6, dd+7, dd+8, dd+9, dd+10, dd+11, dd+12, dd+13, dd+14, dd+15, dd+16, dd+17, dd+18, dd+19, dd+20];
			    end
			end

			soma=sum(sum(sum(instance(b,c,d) == 1))); %count the number of voxels that will be cut away from the skull model by the cube
            fprintf('2. soma %d \n', soma);
            fprintf('3. filename %s \n', filename);
			if soma<400 %if the number of voxels to be cut is less than 400, generate another cube until the condition of more than 400 voxels to cut is met
                %fprintf('4. hey %d \n', enough);
                continue;
            end
            enough=1;
        end

		defected(b,c,d) = 0; %cut the cube from the skull model
		save(filename, 'instance','defected'); %save the intact skull and the resultant artificially corrupted skull model in the same .mat file but in different variables
	end				


end

%{
figure;    
p = isosurface(squeeze(new_instance),0.5) ;
 patch( p,'facecolor',[1 0 0],'edgecolor','none'), camlight;view(3)  

axis equal 
axis on      
lighting gouraud
pause;

close all;
%}