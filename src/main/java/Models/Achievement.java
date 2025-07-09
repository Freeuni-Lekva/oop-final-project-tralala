package Models;

//Achievementebis klasi
public class Achievement {
    private int achId;
    private String achievementName;
    private String achievementUrl;
    private String achievementDescription;

    /**
     * Constructs a new Achievement with the specified details.
     *
     * @param achId          the unique ID of the achievement
     * @param achievementName        the name of the achievement
     * @param achievementUrl         the URL associated with the achievement
     * @param achievementDescription a description of the achievement
     */
    public Achievement(int achId,
                       String achievementName,
                       String achievementUrl,
                       String achievementDescription) {
        this.achId = achId;
        this.achievementName = achievementName;
        this.achievementUrl = achievementUrl;
        this.achievementDescription = achievementDescription;
    }

    // return id
    public int getAchievementId() {
        return achId;
    }

    /**
     * Sets the unique ID of the achievement.
     *
     * @param achId the new achievement ID
     */
    ///  setteri
    public void setAchievementId(int achId) {
        this.achId = achId;
    }

    /**
     * Gets the name of the achievement.
     *
     * @return the achievement name
     */
    //getteri
    public String getAchievementName() {

        return achievementName;
    }

    /**
     * Sets the name of the achievement.
     *
     * @param achnm the new achievement name
     */
    public void setAchievementName(String achnm) {

        this.achievementName = achnm;
    }

    /**
     * Gets the URL associated with the achievement.
     *
     * @return the achievement URL
     */
    //get URL
    public String getAchievementUrl() {
        return achievementUrl;
    }

    /**
     * Sets the URL associated with the achievement.
     *
     * @param urlach the new achievement URL
     */
    public void setAchievementUrl(String urlach) {
        this.achievementUrl = urlach;
    }

    /**
     * Gets the description of the achievement.
     *
     * @return the achievement description
     */
    public String getAchievementDescription() {
        //ret descrp
        return achievementDescription;
    }

    /**
     * Sets the description of the achievement.
     *
     * @param someth the new achievement description
     */
    public void setAchievementDescription(String someth) {
        this.achievementDescription = someth;
    }
}
