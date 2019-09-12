//
/**
 * Copyright (C) 2018 HAT Data Exchange Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

// MARK: - Twitter

/**
 The data needed for communicating with `Twitter` `Data Plug`
 */
public enum Twitter: HATDataPlugProtocol {
    
    // MARK: - Variables
    
    public static var name: String = "tweets"
    public static var source: String = "twitter"
}

// MARK: - Spotify

/**
 The strings needed for communicating with `Spotify` `Data Plug`
 */
public enum Spotify: HATDataPlugProtocol {
    
    // MARK: - Variables

    public static var name: String = "spotify"
    public static var source: String = "spotify"
}

// MARK: - Fitbit

/**
 The strings needed for communicating with `Fitbit` `Data Plug`
 */
public enum Fitbit: HATDataPlugProtocol {
    
    // MARK: - Variables

    public static var name: String = "fitbit"
    public static var source: String = "Fitbit"
}

// MARK: - Facebook

/**
 The strings needed for communicating with `Facebook` `Data Plug`
 */
public enum Facebook: HATDataPlugProtocol {
    
    // MARK: - Variables

    public static var name: String = "feed"
    public static var source: String = "facebook"
}

// MARK: - Google Calendar

/**
 The strings needed for communicating with `Google Calendar` `Data Plug`
 */
public enum GoogleCalendar: HATDataPlugProtocol {
    
    // MARK: - Variables

    public static var name: String = "google/events"
    public static var source: String = "calendar"
}
