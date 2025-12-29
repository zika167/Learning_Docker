# 1. Dng Ubuntu mi nht
FROM ubuntu:24.04

# 2. To th mc lm vic
WORKDIR /usr/src/app

# 3. Ci t curl (v Ubuntu gc khng c)
RUN apt-get update && apt-get install -y curl

# 4. Copy file script vo trong container
COPY script.sh .

# 5. Cp quyn chy cho script
RUN chmod +x script.sh

# 6. QUAN TRNG: Dng ENTRYPOINT  c nh lnh chy
ENTRYPOINT ["./script.sh"]
