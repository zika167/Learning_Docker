# 1. Bt u t Ubuntu 24.04 theo yu cu
FROM ubuntu:24.04

# 2. Thit lp th mc lm vic (ty chn nhng nn lm cho gn)
WORKDIR /usr/src/app

# 3. CI T CURL (y l bc gii quyt bi ton)
# Chng ta phi update danh sch gi trc, sau  mi ci curl
RUN apt-get update && apt-get install -y curl

# 4. Copy script t my tht vo trong container
COPY script.sh .

# 5. Cp quyn thc thi cho script
RUN chmod +x script.sh

# 6. Chy script
CMD ["./script.sh"]
