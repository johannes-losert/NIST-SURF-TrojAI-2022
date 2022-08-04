import torch 
import numpy as np
import math 


# method that tweaks a given ratio of pytorch AI model parameters by the smallest amount in a random direction 
def tweak(modelfilepath, outputfile,bits):
    
    model = torch.load(modelfilepath)
    model.requires_grad_(False)
    
    for tensor in model.parameters():
        PM32 = torch.from_numpy(np.random.choice(a=[np.inf, -np.inf], size =tensor.size(), p=[0.5,0.5]))
        PM16 = np.random.choice(a=[np.inf, -np.inf], size =tensor.size(), p=[0.5,0.5])

        if bits == 32:
            temp = np.nextafter(tensor,PM32,dtype=np.float32)
            temp = np.nextafter(temp,PM32,dtype=np.float32)

        elif bits == 16:
            temp = tensor.detach().numpy().astype('float16')
            temp = np.nextafter(temp,PM16,dtype=np.float16)
            temp = temp.astype('float32')
            temp = torch.from_numpy(temp)
        
        # change p value to change share of parameters that get "tweaked" default is 50%
        mask = torch.from_numpy(np.random.choice(a=[True,False], size = tensor.size(), p=[0.5, 0.5]))
        tensor[mask] = temp[mask]

    model.requires_grad_(True)
    torch.save(model,f=outputfile)
        
