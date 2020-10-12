# IaaS_for_Disseration
## Scripts for setting up the infrastructure via repeatable scripts
* Initial scripts will use simple bash scripting protocols
  * Single line operations with ';' or '&' separators end '\' end of line continuations
  * This provides a cloud/hardware agnostic foundation
  * Can be promoted later to other frameworks as needed
* Fast developer cycles and repeatability
  * Initial development on hard iron server proved difficult
  * Maintaining configuration management on changes difficult
  * Better method was fully scripted infrastructure creation using cloud based instances
  * Initial testing will be on Amazon Web Services (AWS) and Google CLoud Platform (GCP)
* Infrastructure Scripts
  * Provide a repeatable baseline for foundational infrastructure
    * Start with Ubunut Focal 20.04 LTS
    * Full system upgrade to all system packages 
    * All Nvidia drivers and packages 
    * Docker specific version installed
      * All of these can change as needed to address bug fixes
    * Full AMI image burned for repeatable ease of use on AWS
      * Maintains consistent builds for experimental variable reduction
  * Stand up and stand down using VMs has approximate 3 min cycle times
  * This will be known as the "Base Container Build"
* Extending Base Container Build
  * Container system will install Nvidia GPU Container Platform (GCP)
  * Initial development will leverage Nvidia product stack
    * https://developer.nvidia.com/deep-learning-software
    * This will provide a baseline reference for future development
  * Various higher Deep Neural Net (DNN) languages and meta-languages will be experimented with
    * Fast.ai
    * Nvidia meta languages for Tensor Flow (TF) and PyTorch
    * TF, PyTorch, other
    * Containerized and non-containerized
* Custom development and transfer learning
  * The main experiments will be based on a standard TBD platform based on above experimentation
  * This will provide a stable and repeatable infrastructure baseline
  * Developer cycle times for standup of new baseline will be approximately 30 seconds or less
* Deployment Environments for Inferencing
  * Various deployment architectures will be experimented with
    * TensorRT language
    * NVidia Inferencing Environment
    * Custom deployment
    * Alternative approaches
