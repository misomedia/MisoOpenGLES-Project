//
//  MisoOpenGLESObject.m
//  MisoOpenGLES
//
//  Created by Ryan Tsukamoto on 5/11/12.
//  Copyright (c) 2012 Miso Media. All rights reserved.
//

#import <MisoOpenGLES/MisoOpenGLESObject.h>

@implementation MisoOpenGLESObject

@synthesize	tx = _tx;
@synthesize	ty = _ty;
@synthesize	sx = _sx;
@synthesize	sy = _sy;
@synthesize subobjects = _subobjects;

+(MisoOpenGLESObject*)objectWithSubobjects:(NSArray*)subobjects{return [[MisoOpenGLESObject alloc] initWithTx:0.0f ty:0.0f sx:1.0f sy:1.0f subobjects:subobjects];}

+(MisoOpenGLESObject*)objectAtPoint:(CGPoint)point subobjects:(NSArray*)subobjects{return [[MisoOpenGLESObject alloc] initWithTx:point.x ty:point.y sx:1.0f sy:1.0f subobjects:subobjects];}

+(MisoOpenGLESObject*)objectAtPoint:(CGPoint)point xScaleFactor:(GLfloat)xScaleFactor yScaleFactor:(GLfloat)yScaleFactor subobjects:(NSArray*)subobjects{return [[MisoOpenGLESObject alloc] initWithTx:point.x ty:point.y sx:xScaleFactor sy:yScaleFactor subobjects:subobjects];}

-(id)initWithTx:(GLfloat)tx ty:(GLfloat)ty sx:(GLfloat)sx sy:(GLfloat)sy subobjects:(NSArray*)subobjects
{
	if(self = [super init])
	{
		self.tx = tx;
		self.ty = ty;
		self.sx = sx;
		self.sy = sy;
		self.subobjects = subobjects;
	}
	return self;
}

-(void)draw
{
	glPushMatrix();
	glTranslatef(_tx, _ty, 0.0f);
	glScalef(_sx, _sy, 1.0f);
	[self drawContent];
	[self.subobjects makeObjectsPerformSelector:@selector(draw)];
	glPopMatrix();
}

-(void)drawContent{}

@end