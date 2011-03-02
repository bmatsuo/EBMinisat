export MROOT=${CURDIR}

DEFBUILD=simp

all:
	@echo
	@echo Use 'gmake rs' to build EBMiniSAT.
	@echo

rs: rs-${DEFBUILD}
	@echo
	@echo EBMiniSAT built successfully!
	@echo
rs-core:
	cd core && gmake rs
	cp core/ebminisat_static .
rs-simp:
	cd simp && gmake rs
	cp simp/ebminisat_static .

d:
	cd ${DEFBUILD} && gmake d
	cp ${DEFBUILD}/ebminisat_debug .
d-simp:
	cd simp && gmake d
	cp simp/ebminisat_debug .
d-core:
	cd core && gmake d
	cp core/ebminisat_debug .

clean:
	rm -f core/*.o core/*.or core/*.od
	rm -f simp/*.o simp/*.or simp/*.od
	rm -f utils/*.o utils/*.or utils/*.od
spotless: clean
	rm -f core/ebminisat*
	rm -f simp/ebminisat*
	rm -f ebminisat*
