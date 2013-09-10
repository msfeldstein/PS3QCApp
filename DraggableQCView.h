//
//  DraggableQCView.h
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 9/10/13.
//
//



@interface DraggableQCView : QCView {
    @private
    NSOpenGLContext*   _openGLContext;
    NSOpenGLPixelFormat* _pixelFormat;
}
@end
