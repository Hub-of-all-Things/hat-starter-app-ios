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

// MARK: Notables

/**
 The strings needed for communicating with notables service
 */
public enum Notables: HATApplicationProtocol {
    
    // MARK: - Variables
    
    public static var name: String = "notablesv1"
    public static var source: String = "rumpel"
}

// MARK: - DataBuyer

/**
 The strings needed for generating databuyer token
 */
public enum DataBuyer: HATApplicationProtocol {
    
    // MARK: - Variables

    public static var name: String = "DataBuyer"
    public static var source: String = "https://databuyer.hubat.net/"
}

// MARK: - Dex

/**
 The strings needed for generating Dex token
 */
public enum Dex: HATApplicationProtocol {
    
    // MARK: - Variables

    public static var name: String = "Dex"
    public static var source: String = "https://dex.hubofallthings.com/"
}
