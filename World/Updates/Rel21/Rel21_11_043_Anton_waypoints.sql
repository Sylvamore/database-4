-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.4)
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT structure FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurContent := (SELECT content FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '11'; 
    SET @cOldContent = '042';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '043';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Anton waypoints';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Anton waypoints';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

    
-- Anton 24291
-- waypoints
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 116945;
UPDATE creature_template SET MovementType = 2 WHERE entry = 24291;
DELETE FROM creature_movement_template WHERE entry = 24291;
INSERT INTO creature_movement_template (entry,point,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(24291,1,149.96,-4553.28,262.223,0,0,0.99096),
(24291,2,155.143,-4540.78,259.997,0,0,1.45827),
(24291,3,155.673,-4517.71,257.199,0,0,1.62321),
(24291,4,152.041,-4501.26,256.105,0,0,1.73709),
(24291,5,149.198,-4487.06,255.292,0,0,1.8117),
(24291,6,146.234,-4479.18,255.366,0,0,1.79992),
(24291,7,143.013,-4465.56,253.743,0,0,1.80385),
(24291,8,137.899,-4452.23,253.718,0,0,2.18477),
(24291,9,128.589,-4441.25,254.109,0,0,2.05517),
(24291,10,124.699,-4432.37,254.502,0,0,1.84704),
(24291,11,122.029,-4420.46,255.408,0,0,1.71353),
(24291,12,120.829,-4408.8,255.928,0,0,1.61535),
(24291,13,120.515,-4393.74,256.878,0,0,1.58001),
(24291,14,120.89,-4380.99,257.703,0,0,1.32083),
(24291,15,124.204,-4372.29,258.292,0,0,1.15197),
(24291,16,128.833,-4361.59,258.724,0,0,1.03023),
(24291,17,134.028,-4354.42,258.458,0,0,0.865296),
(24291,18,141.097,-4346.66,257.936,0,0,0.818172),
(24291,19,148.594,-4337.89,257.548,0,0,0.932055),
(24291,20,156.105,-4324.7,257.133,0,0,1.03416),
(24291,21,162.772,-4315.7,256.206,0,0,0.759267),
(24291,22,171.15,-4308.81,254.307,0,0,0.63468),
(24291,23,179.113,-4303.02,252.292,0,0,0.642534),
(24291,24,188.886,-4292.8,249.697,0,0,0.819249),
(24291,25,198.275,-4284.11,248.583,0,0,0.536505),
(24291,26,208.292,-4278.63,248.504,0,0,0.339028),
(24291,27,221.05,-4276.3,248.547,0,0,0.0798469),
(24291,28,230.271,-4275.98,248.532,0,0,6.26486),
(24291,29,240.825,-4275.74,248.641,0,0,0.496108),
(24291,30,251.049,-4266.69,249.404,0,0,0.833829),
(24291,31,260.499,-4256.37,250.48,0,0,0.798487),
(24291,32,272.585,-4245.52,251.408,0,0,0.712093),
(24291,33,283.745,-4234.86,252.19,0,0,1.04981),
(24291,34,288.93,-4222.1,252.972,0,0,1.43073),
(24291,35,290.132,-4207.87,253.636,0,0,1.54854),
(24291,36,290.217,-4196.23,254.276,0,0,1.19511),
(24291,37,295.988,-4186.86,255.454,0,0,0.888807),
(24291,38,305.327,-4176.72,257.114,0,0,0.664969),
(24291,39,296.558,-4186.11,255.58,0,0,4.07752),
(24291,40,290.697,-4195.03,254.377,0,0,4.45844),
(24291,41,290.182,-4206.87,253.694,0,0,4.60059),
(24291,42,289.101,-4221.43,253.007,0,0,4.37283),
(24291,43,283.795,-4234.59,252.209,0,0,3.86625),
(24291,44,273.248,-4244.87,251.441,0,0,3.81912),
(24291,45,261.281,-4255.56,250.567,0,0,4.0194),
(24291,46,251.672,-4266.04,249.465,0,0,3.90944),
(24291,47,242.05,-4275.47,248.678,0,0,3.23793),
(24291,48,231.049,-4275.76,248.542,0,0,3.12405),
(24291,49,221.947,-4276.11,248.528,0,0,3.29683),
(24291,50,209.428,-4278.27,248.501,0,0,3.57958),
(24291,51,199.318,-4283.04,248.529,0,0,3.8309),
(24291,52,189.158,-4292.38,249.63,0,0,4.01964),
(24291,53,179.915,-4302.05,252.077,0,0,3.78795),
(24291,54,171.613,-4308.37,254.147,0,0,3.79973),
(24291,55,163.343,-4315.12,256.096,0,0,4.09033),
(24291,56,156.375,-4324.08,257.084,0,0,4.14923),
(24291,57,149.616,-4336.31,257.521,0,0,4.09425),
(24291,58,141.801,-4346.2,257,0,0.9,3.91361),
(24291,59,134.6,-4353.35,258.398,0,0,4.09818),
(24291,60,128.816,-4361.44,258.719,0,0,4.29453),
(24291,61,121.143,-4379.98,257.778,0,0,4.53014),
(24291,62,120.395,-4392.43,256.931,0,0,4.73434),
(24291,63,120.566,-4407.29,256.023,0,0,4.73042),
(24291,64,121.646,-4419.58,255.439,0,0,4.95818),
(24291,65,124.204,-4431.29,254.607,0,0,5.09169),
(24291,66,127.976,-4440.27,254.131,0,0,5.18987),
(24291,67,137.178,-4450.98,253.741,0,0,5.07599),
(24291,68,142.694,-4464.59,253.681,0,0,5.03279),
(24291,69,145.694,-4478.18,255.326,0,0,4.98174),
(24291,70,148.784,-4486.48,255.301,0,0,5.0577),
(24291,71,151.608,-4499.94,256.064,0,0,4.93989),
(24291,72,155.54,-4517.54,257.189,0,0,4.8535),
(24291,73,156.522,-4529.74,258.49,0,0,4.64145),
(24291,74,155.561,-4539.96,259.836,0,0,4.41761),
(24291,75,150.22,-4552.79,262.125,0,0,4.10346),
(24291,76,143.791,-4561.93,264.594,0,0,4.00921);

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;
        ELSE
            COMMIT;
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
                IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
                    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;


