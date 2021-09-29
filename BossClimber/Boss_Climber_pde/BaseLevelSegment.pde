class BaseLevelSegment
{
    float sizeX, sizeY, angle;
    PVector platformPos;
    
    BaseLevelSegment(PVector platformPos, float sizeX, float sizeY, float angle)
    {
        this.platformPos = platformPos;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.angle = angle;
    }
    
    void draw()
    {
        fill(0, 255, 0);
        float rot = radians(angle);
       
        rotate(rot);
        fill(0,255,0);
        rect(platformPos.x, platformPos.y, sizeX, sizeY);
    }
}
