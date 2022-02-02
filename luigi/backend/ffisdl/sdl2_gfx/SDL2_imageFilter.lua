local ffi = require("ffi")
ffi.cdef[[
int SDL_imageFilterMMXdetect(void);
void SDL_imageFilterMMXoff(void);
void SDL_imageFilterMMXon(void);
int SDL_imageFilterAdd(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterMean(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterSub(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterAbsDiff(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterMult(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterMultNor(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterMultDivby2(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterMultDivby4(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterBitAnd(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterBitOr(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterDiv(unsigned char *Src1, unsigned char *Src2, unsigned char *Dest, unsigned int length);
int SDL_imageFilterBitNegation(unsigned char *Src1, unsigned char *Dest, unsigned int length);
int SDL_imageFilterAddByte(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char C);
int SDL_imageFilterAddUint(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned int C);
int SDL_imageFilterAddByteToHalf(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char C);
int SDL_imageFilterSubByte(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char C);
int SDL_imageFilterSubUint(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned int C);
int SDL_imageFilterShiftRight(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char N);
int SDL_imageFilterShiftRightUint(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char N);
int SDL_imageFilterMultByByte(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char C);
int SDL_imageFilterShiftRightAndMultByByte(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char N, unsigned char C);
int SDL_imageFilterShiftLeftByte(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char N);
int SDL_imageFilterShiftLeftUint(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char N);
int SDL_imageFilterShiftLeft(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char N);
int SDL_imageFilterBinarizeUsingThreshold(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char T);
int SDL_imageFilterClipToRange(unsigned char *Src1, unsigned char *Dest, unsigned int length, unsigned char Tmin, unsigned char Tmax);
int SDL_imageFilterNormalizeLinear(unsigned char *Src, unsigned char *Dest, unsigned int length, int Cmin, int Cmax, int Nmin, int Nmax);
]]
